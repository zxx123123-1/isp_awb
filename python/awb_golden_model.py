from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Tuple

import numpy as np
from scipy import ndimage


Q12_ONE = 4096
GAIN_MIN_Q12 = 2048
GAIN_MAX_Q12 = 12288
GAIN_TARGET_TRUST_Q12 = 7373
LOW_CONF_VALID_RATIO_PM = 400


@dataclass
class RawFrame:
    source_path: Path
    mosaic_u12: np.ndarray
    bayer_name: str
    bayer_code: int
    black_levels: Tuple[int, int, int, int]
    white_level: int


@dataclass
class AwbFrameResult:
    block_r_u8: np.ndarray
    block_g_u8: np.ndarray
    block_b_u8: np.ndarray
    block_y_luma_u8: np.ndarray
    block_weight_u4: np.ndarray
    mask_valid: np.ndarray
    mask_sat: np.ndarray
    edge_mag_u10: np.ndarray
    y_hist: np.ndarray
    e_hist: np.ndarray
    pending_gr_q12: int
    pending_gg_q12: int
    pending_gb_q12: int
    pending_y_low: int
    pending_y_high: int
    pending_e_th: int
    conf_sog: int
    conf_edge: int
    hold: int
    scene_change: int
    count_all: int
    count_valid: int
    count_edge: int
    count_sat: int
    sum_y: int
    mean_y_bucket: int
    gw_r: int = 0
    gw_g: int = 0
    gw_b: int = 0
    raw_target_gr_q12: int = Q12_ONE
    raw_target_gb_q12: int = Q12_ONE
    target_gr_q12: int = Q12_ONE
    target_gb_q12: int = Q12_ONE
    valid_ratio_pm: int = 0
    gain_cap_q12: int = Q12_ONE
    scene_dominant: int = 0
    hold_reason: str = ""
    gain_step_q12: int = 0

#小写转大写，并检查
def _normalize_bayer_name(name: str) -> str:
    name = name.upper()
    if name not in {"RGGB", "GRBG", "GBRG", "BGGR"}:
        raise ValueError(f"unsupported Bayer pattern: {name}")
    return name

#字符串名字转成数字编号
def bayer_name_to_code(name: str) -> int:
    name = _normalize_bayer_name(name)
    return {
        "RGGB": 0,
        "GRBG": 1,
        "GBRG": 2,
        "BGGR": 3,
    }[name]

#数字编号转成字符串名字
def bayer_code_to_name(code: int) -> str:
    return {
        0: "RGGB",
        1: "GRBG",
        2: "GBRG",
        3: "BGGR",
    }[code]

#根据通道编号返回对应的颜色符号
def _channel_symbol(channel_id: int) -> str:
    if channel_id == 0:
        return "R"
    if channel_id == 2:
        return "B"
    if channel_id in (1, 3):
        return "G"
    raise ValueError(f"unsupported raw channel id: {channel_id}")

#根据 RAW 图案返回对应的 Bayer 名称
def raw_pattern_to_bayer_name(raw_pattern: np.ndarray) -> str:
    if raw_pattern is None or raw_pattern.shape != (2, 2):
        raise ValueError("raw pattern is unavailable or malformed")
    chars = [_channel_symbol(int(v)) for v in raw_pattern.reshape(-1)]
    name = "".join(chars)
    return _normalize_bayer_name(name)

#读取 RAW/DNG 文件，并返回 RawFrame 对象
def load_raw_frame(path: str | Path) -> RawFrame:
    try:
        import rawpy
    except ImportError as exc:
        raise RuntimeError(
            "rawpy 未安装，无法读取 RAW/DNG。请先安装 rawpy。"
        ) from exc

    source_path = Path(path).resolve()
    with rawpy.imread(str(source_path)) as raw:
        visible = raw.raw_image_visible.astype(np.int32)
        bayer_name = raw_pattern_to_bayer_name(raw.raw_pattern.copy())
        bayer_code = bayer_name_to_code(bayer_name)
        black_levels = tuple(int(v) for v in raw.black_level_per_channel[:4])
        white_level = int(raw.white_level)

    mosaic_u12 = normalize_raw_to_u12(
        visible=visible,
        black_levels=black_levels,
        white_level=white_level,
        bayer_name=bayer_name,
    )
    return RawFrame(
        source_path=source_path,
        mosaic_u12=mosaic_u12,
        bayer_name=bayer_name,
        bayer_code=bayer_code,
        black_levels=black_levels,
        white_level=white_level,
    )

#将 RAW 图像数据归一化为 12 位无符号整数
def normalize_raw_to_u12(
    visible: np.ndarray,
    black_levels: Tuple[int, int, int, int],
    white_level: int,
    bayer_name: str,
) -> np.ndarray:
    h, w = visible.shape
    h_even = h - (h % 2)
    w_even = w - (w % 2)
    visible = visible[:h_even, :w_even]

    tl, tr, bl, br = _black_level_grid(black_levels, bayer_name)
    black_map = np.empty_like(visible, dtype=np.int32)
    black_map[0::2, 0::2] = tl
    black_map[0::2, 1::2] = tr
    black_map[1::2, 0::2] = bl
    black_map[1::2, 1::2] = br

    denom = max(1, white_level - int(np.min(black_levels)))
    linear = np.clip(visible - black_map, 0, None).astype(np.float64)
    scaled = np.round(linear * 4095.0 / float(denom))
    return np.clip(scaled, 0, 4095).astype(np.uint16)

#将四通道的黑电平值映射到 Bayer 图案的网格中
def _black_level_grid(
    black_levels: Tuple[int, int, int, int], bayer_name: str
) -> Tuple[int, int, int, int]:
    symbols = {
        "RGGB": ("R", "G", "G", "B"),
        "GRBG": ("G", "R", "B", "G"),
        "GBRG": ("G", "B", "R", "G"),
        "BGGR": ("B", "G", "G", "R"),
    }[_normalize_bayer_name(bayer_name)]

    channel_black: Dict[str, int] = {
        "R": int(black_levels[0]),
        "G": int(min(black_levels[1], black_levels[3])),
        "B": int(black_levels[2]),
    }
    return tuple(channel_black[s] for s in symbols)

# 将 16 位整数数组右移并裁剪为 8 位无符号整数
def clip_shift_u8(value: np.ndarray, stat_shift: int = 4) -> np.ndarray:
    shifted = np.right_shift(value.astype(np.uint32), stat_shift)
    return np.clip(shifted, 0, 255).astype(np.uint8)

# 将马赛克图像分解为 R、G、B 块（重点）
def build_block_rgb(
    mosaic_u12: np.ndarray, bayer_code: int, stat_shift: int = 4
) -> Tuple[np.ndarray, np.ndarray, np.ndarray]:
    top0 = mosaic_u12[0::2, 0::2].astype(np.uint16)
    top1 = mosaic_u12[0::2, 1::2].astype(np.uint16)
    bot0 = mosaic_u12[1::2, 0::2].astype(np.uint16)
    bot1 = mosaic_u12[1::2, 1::2].astype(np.uint16)

    if bayer_code == 0:
        r16 = top0
        g16 = ((top1.astype(np.uint32) + bot0.astype(np.uint32)) >> 1).astype(np.uint16)
        b16 = bot1
    elif bayer_code == 1:
        r16 = top1
        g16 = ((top0.astype(np.uint32) + bot1.astype(np.uint32)) >> 1).astype(np.uint16)
        b16 = bot0
    elif bayer_code == 2:
        r16 = bot0
        g16 = ((top0.astype(np.uint32) + bot1.astype(np.uint32)) >> 1).astype(np.uint16)
        b16 = top1
    elif bayer_code == 3:
        r16 = bot1
        g16 = ((top1.astype(np.uint32) + bot0.astype(np.uint32)) >> 1).astype(np.uint16)
        b16 = top0
    else:
        raise ValueError(f"unsupported Bayer code: {bayer_code}")
    #将 16 位整数数组右移并裁剪为 8 位无符号整数
    return (
        clip_shift_u8(r16, stat_shift),
        clip_shift_u8(g16, stat_shift),
        clip_shift_u8(b16, stat_shift),
    )

# 将 R、G、B 块预处理为亮度块和权重块（重点）
def preprocess_blocks(
    block_r_u8: np.ndarray,
    block_g_u8: np.ndarray,
    block_b_u8: np.ndarray,
    img_height: int,
    top_weight: int = 1,
    normal_weight: int = 2,
) -> Tuple[np.ndarray, np.ndarray, np.ndarray]:
    rows, cols = block_r_u8.shape
    block_y = (np.arange(rows, dtype=np.uint16) * 2)[:, None].repeat(cols, axis=1)
    y_sum = (
        block_r_u8.astype(np.uint16)
        + (block_g_u8.astype(np.uint16) << 1)
        + block_b_u8.astype(np.uint16)
    )
    block_y_luma = np.right_shift(y_sum, 2).astype(np.uint8)
    top_lines = img_height // 5
    block_weight = np.where(block_y < top_lines, top_weight, normal_weight).astype(np.uint8)
    return block_y, block_y_luma, block_weight

# 计算有效块掩码和饱和块掩码(重点)
def compute_mask(
    block_r_u8: np.ndarray,
    block_g_u8: np.ndarray,
    block_b_u8: np.ndarray,
    block_y_luma_u8: np.ndarray,
    y_low: int,
    y_high: int,
    sat_th: int = 250,
    rg_lo_q8: int = 115,
    rg_hi_q8: int = 563,
    bg_lo_q8: int = 115,
    bg_hi_q8: int = 563,
) -> Tuple[np.ndarray, np.ndarray]:
    r = block_r_u8.astype(np.uint16)
    g = block_g_u8.astype(np.uint16)
    b = block_b_u8.astype(np.uint16)
    y = block_y_luma_u8.astype(np.uint16)

    max_rgb = np.maximum(np.maximum(r, g), b)
    valid_luma = (y > y_low) & (y < y_high)
    valid_sat = max_rgb < sat_th
    rg_lhs = r.astype(np.uint32) << 8
    bg_lhs = b.astype(np.uint32) << 8
    valid_rg = (rg_lhs >= (rg_lo_q8 * g.astype(np.uint32))) & (
        rg_lhs <= (rg_hi_q8 * g.astype(np.uint32))
    )
    valid_bg = (bg_lhs >= (bg_lo_q8 * g.astype(np.uint32))) & (
        bg_lhs <= (bg_hi_q8 * g.astype(np.uint32))
    )
    reject_red = ((r << 2) > (9 * g)) & ((r << 1) > (3 * b))
    reject_blue = ((b << 2) > (9 * g)) & ((b << 1) > (3 * r))

    mask_sat = (~valid_sat).astype(np.uint8)
    mask_valid = (
        valid_luma
        & valid_sat
        & valid_rg
        & valid_bg
        & (~reject_red)
        & (~reject_blue)
    ).astype(np.uint8)
    return mask_valid, mask_sat

#把增益钳制在最小0.5倍到最大3倍之间
def clamp_gain_q12(value: int, max_gain_q12: int = GAIN_MAX_Q12) -> int:
    return max(GAIN_MIN_Q12, min(max_gain_q12, int(value)))

#根据计数和总数计算置信度等级
def conf_from_ratio(count: int, total: int, strong_per_mille: int, med_per_mille: int, weak_per_mille: int) -> int:
    if total == 0:
        return 0
    scaled = count * 1000
    if scaled > total * strong_per_mille:
        return 3
    if scaled > total * med_per_mille:
        return 2
    if scaled > total * weak_per_mille:
        return 1
    return 0

#如果饱和点太多，就把置信度降低一级
def dec_conf(conf: int) -> int:
    return 0 if conf == 0 else conf - 1

#根据前一帧的增益和当前估计的增益，使用 IIR 滤波器计算下一帧的增益
def iir_step_q12(prev: int, est: int, beta_shift: int) -> int:
    delta = int(est) - int(prev)
    accum = int(prev) + (delta >> beta_shift)
    return max(0, accum)

#根据当前的红绿增益和蓝绿增益估计下一帧的增益
def estimate_gain_q12(num: int, den: int, prev_gain: int) -> int:
    if num == 0 or den == 0:
        return int(prev_gain)
    return (int(num) << 12) // int(den)

#扫描直方图，找到第一个累积计数超过目标的 bin，并返回对应的值
def _scan_hist_threshold(hist: np.ndarray, target: int, default_value: int) -> int:
    found = default_value
    cume = 0
    for bin_idx in range(64):
        cume += int(hist[bin_idx])
        if found == default_value and cume >= target:
            found = bin_idx << 2
    return found

#运行 AWB 黄金模型，处理一帧马赛克图像，并返回结果（重要）
def run_awb_frame_model(
    mosaic_u12: np.ndarray,
    bayer_code: int,
    enable_edge: bool = False,
    stat_shift: int = 4,
    top_weight: int = 1,
    normal_weight: int = 2,
    prev_gr_q12: int = Q12_ONE,
    prev_gg_q12: int = Q12_ONE,
    prev_gb_q12: int = Q12_ONE,
    active_y_low: int = 4,
    active_y_high: int = 250,
    active_e_th: int = 24,
    prev_mean_y: int = 0,
) -> AwbFrameResult:
    #产生rgby，及掩码
    img_height, img_width = mosaic_u12.shape
    block_r_u8, block_g_u8, block_b_u8 = build_block_rgb(
        mosaic_u12=mosaic_u12,
        bayer_code=bayer_code,
        stat_shift=stat_shift,
    )
    block_y, block_y_luma_u8, block_weight_u4 = preprocess_blocks(
        block_r_u8=block_r_u8,
        block_g_u8=block_g_u8,
        block_b_u8=block_b_u8,
        img_height=img_height,
        top_weight=top_weight,
        normal_weight=normal_weight,
    )
    mask_valid, mask_sat = compute_mask(
        block_r_u8=block_r_u8,
        block_g_u8=block_g_u8,
        block_b_u8=block_b_u8,
        block_y_luma_u8=block_y_luma_u8,
        y_low=active_y_low,
        y_high=active_y_high,
    )

    rows, cols = block_r_u8.shape
    if cols % 2 != 0:
        raise ValueError("当前黄金模型要求 block 列数为偶数，以匹配 RTL 的 BLOCKS_PER_CYCLE=2")

    prev_r_line = np.zeros(cols, dtype=np.uint8)
    prev_g_line = np.zeros(cols, dtype=np.uint8)
    prev_b_line = np.zeros(cols, dtype=np.uint8)

    y_hist = np.zeros(64, dtype=np.int64)
    e_hist = np.zeros(64, dtype=np.int64)
    edge_mag_u10 = np.zeros((rows, cols), dtype=np.uint16)

    live_gw_r = 0
    live_gw_g = 0
    live_gw_b = 0
    live_sum_y = 0
    live_count_all = 0
    live_count_valid = 0
    live_count_edge = 0
    live_count_sat = 0

    for row_idx in range(rows):
        block_y_val = int(block_y[row_idx, 0])
        for pair_idx in range(cols // 2):
            lane0_x = pair_idx * 2
            lane1_x = lane0_x + 1

            lane0_r = int(block_r_u8[row_idx, lane0_x])
            lane0_g = int(block_g_u8[row_idx, lane0_x])
            lane0_b = int(block_b_u8[row_idx, lane0_x])
            lane0_y = int(block_y_luma_u8[row_idx, lane0_x])
            lane0_w = int(block_weight_u4[row_idx, lane0_x])
            lane0_mask_valid = int(mask_valid[row_idx, lane0_x])
            lane0_mask_sat = int(mask_sat[row_idx, lane0_x])

            lane1_r = int(block_r_u8[row_idx, lane1_x])
            lane1_g = int(block_g_u8[row_idx, lane1_x])
            lane1_b = int(block_b_u8[row_idx, lane1_x])
            lane1_y = int(block_y_luma_u8[row_idx, lane1_x])
            lane1_w = int(block_weight_u4[row_idx, lane1_x])
            lane1_mask_valid = int(mask_valid[row_idx, lane1_x])
            lane1_mask_sat = int(mask_sat[row_idx, lane1_x])

            up_valid0 = block_y_val != 0
            up_valid1 = block_y_val != 0
            up_r0 = int(prev_r_line[lane0_x]) if up_valid0 else lane0_r
            up_g0 = int(prev_g_line[lane0_x]) if up_valid0 else lane0_g
            up_b0 = int(prev_b_line[lane0_x]) if up_valid0 else lane0_b
            up_r1 = int(prev_r_line[lane1_x]) if up_valid1 else lane1_r
            up_g1 = int(prev_g_line[lane1_x]) if up_valid1 else lane1_g
            up_b1 = int(prev_b_line[lane1_x]) if up_valid1 else lane1_b

            left_valid0 = False
            left_valid1 = lane1_x != 0
            left_r1 = lane0_r
            left_g1 = lane0_g
            left_b1 = lane0_b

            d_r0 = (abs(lane0_r - (lane0_r if not left_valid0 else 0)) + abs(lane0_r - up_r0)) & 0x1FF
            d_g0 = (abs(lane0_g - (lane0_g if not left_valid0 else 0)) + abs(lane0_g - up_g0)) & 0x1FF
            d_b0 = (abs(lane0_b - (lane0_b if not left_valid0 else 0)) + abs(lane0_b - up_b0)) & 0x1FF
            d_r1 = (abs(lane1_r - (left_r1 if left_valid1 else lane1_r)) + abs(lane1_r - up_r1)) & 0x1FF
            d_g1 = (abs(lane1_g - (left_g1 if left_valid1 else lane1_g)) + abs(lane1_g - up_g1)) & 0x1FF
            d_b1 = (abs(lane1_b - (left_b1 if left_valid1 else lane1_b)) + abs(lane1_b - up_b1)) & 0x1FF
            edge0 = (d_r0 + d_g0 + d_b0) & 0x3FF
            edge1 = (d_r1 + d_g1 + d_b1) & 0x3FF
            edge_mag_u10[row_idx, lane0_x] = edge0
            edge_mag_u10[row_idx, lane1_x] = edge1

            edge_valid0 = lane0_mask_valid and enable_edge and (edge0 > active_e_th) and (lane0_y > 24) 
            edge_valid1 = lane1_mask_valid and enable_edge and (edge1 > active_e_th) and (lane1_y > 24)
            y_bin0 = lane0_y >> 2
            y_bin1 = lane1_y >> 2
            e_bin0 = (edge0 >> 4) & 0x3F
            e_bin1 = (edge1 >> 4) & 0x3F

            live_count_all += 2
            live_count_valid += lane0_mask_valid + lane1_mask_valid
            live_count_edge += int(edge_valid0) + int(edge_valid1)
            live_count_sat += lane0_mask_sat + lane1_mask_sat
            live_sum_y += lane0_y + lane1_y
            live_gw_r += lane0_r * lane0_w * lane0_mask_valid + lane1_r * lane1_w * lane1_mask_valid
            live_gw_g += lane0_g * lane0_w * lane0_mask_valid + lane1_g * lane1_w * lane1_mask_valid
            live_gw_b += lane0_b * lane0_w * lane0_mask_valid + lane1_b * lane1_w * lane1_mask_valid

            y_hist[y_bin0] += 1
            y_hist[y_bin1] += 1
            e_hist[e_bin0] += 1
            e_hist[e_bin1] += 1

            prev_r_line[lane0_x] = lane0_r
            prev_g_line[lane0_x] = lane0_g
            prev_b_line[lane0_x] = lane0_b
            prev_r_line[lane1_x] = lane1_r
            prev_g_line[lane1_x] = lane1_g
            prev_b_line[lane1_x] = lane1_b

    snap_count_all = live_count_all
    snap_count_valid = live_count_valid
    snap_count_edge = live_count_edge
    snap_count_sat = live_count_sat
    snap_sum_y = live_sum_y
    snap_gw_r = live_gw_r
    snap_gw_g = live_gw_g
    snap_gw_b = live_gw_b

    low_target = (snap_count_all * 5) // 100
    high_target = (snap_count_all * 98) // 100
    edge_target = (snap_count_all * 75) // 100
    found_y_low = _scan_hist_threshold(y_hist, low_target, 4)
    found_y_high = _scan_hist_threshold(y_hist, high_target, 250)
    found_e_th = _scan_hist_threshold(e_hist, edge_target, 24)

    #根据当前的亮度均值计算亮度桶值
    if snap_count_all == 0:
        mean_y_cur = 0
    elif snap_sum_y < (snap_count_all << 5):
        mean_y_cur = 16
    elif snap_sum_y < (snap_count_all << 6):
        mean_y_cur = 48
    elif snap_sum_y < (snap_count_all << 7):
        mean_y_cur = 96
    else:
        mean_y_cur = 160

    dark_scene = snap_count_all != 0 and snap_sum_y < (snap_count_all << 5)             #亮度均值小于32，认为是暗场景
    valid_ratio_pm = (snap_count_valid * 1000) // snap_count_all if snap_count_all != 0 else 0   #有效候选点占总点数的比例，乘以1000，作为置信度的参考
    raw_target_gr_q12 = estimate_gain_q12(snap_gw_g, snap_gw_r, prev_gr_q12)                #根据当前的绿红增益和前一帧的绿红增益，估计下一帧的绿红增益
    raw_target_gb_q12 = estimate_gain_q12(snap_gw_g, snap_gw_b, prev_gb_q12)                #根据当前的绿蓝增益和前一帧的绿蓝增益，估计下一帧的绿蓝增益
    next_conf_sog = conf_from_ratio(snap_count_valid, snap_count_all, 600, 200, 5)         #根据有效候选点和总点数计算置信度
    next_conf_edge = conf_from_ratio(snap_count_edge, snap_count_all, 400, 100, 20) if enable_edge else 0      #根据边缘点和总点数计算置信度，如果启用了边缘检测，则计算边缘置信度，否则为0

    if snap_count_all != 0 and (snap_count_sat * 1000) > (snap_count_all * 150):
        next_conf_sog = dec_conf(next_conf_sog)
    if dark_scene:
        next_conf_edge = dec_conf(next_conf_edge)

    #R 和 B 都很弱，只有 G（绿色）特别强，同时有效候选点又特别少
    scene_dominant = int(
        raw_target_gr_q12 > GAIN_TARGET_TRUST_Q12
        and raw_target_gb_q12 > GAIN_TARGET_TRUST_Q12
        and valid_ratio_pm < LOW_CONF_VALID_RATIO_PM
    )
    #根据当前的红绿增益和蓝绿增益估计下一帧的增益，并将其钳制在最小0.5倍到最大3倍之间
    gain_cap_q12 = GAIN_MAX_Q12
    target_gr_q12 = clamp_gain_q12(raw_target_gr_q12, gain_cap_q12)
    target_gb_q12 = clamp_gain_q12(raw_target_gb_q12, gain_cap_q12)

    #根据置信度选择使用目标增益还是前一帧增益
    if next_conf_sog >= 1:
        est_gr_q12 = target_gr_q12
        est_gb_q12 = target_gb_q12
    else:
        est_gr_q12 = prev_gr_q12
        est_gb_q12 = prev_gb_q12

    # 检测场景变化，如果亮度均值或增益变化过大，则认为发生了场景变化
    scene_change = int(
        abs(mean_y_cur - prev_mean_y) > 24
        or abs(est_gr_q12 - prev_gr_q12) > (prev_gr_q12 >> 3)
        or abs(est_gb_q12 - prev_gb_q12) > (prev_gb_q12 >> 3)
    )
    hold = int(next_conf_sog == 0)                              # 如果置信度为0，则保持当前增益
    hold_reason = "zero_confidence" if hold else ""             # 如果保持增益，则记录原因
    beta_shift = 2 if scene_change else (5 if next_conf_sog == 0 else 4) 
    iir_gr_q12 = iir_step_q12(prev_gr_q12, est_gr_q12, beta_shift) #根据前一帧的红绿增益和当前估计的红绿增益，使用 IIR 滤波器计算下一帧的红绿增益
    iir_gb_q12 = iir_step_q12(prev_gb_q12, est_gb_q12, beta_shift) #根据前一帧的蓝绿增益和当前估计的蓝绿增益，使用 IIR 滤波器计算下一帧的蓝绿增益
    delta_gr = prev_gr_q12 >> 4
    delta_gb = prev_gb_q12 >> 4
    pending_gr_q12 = clamp_gain_q12(
        max(prev_gr_q12 - delta_gr, min(prev_gr_q12 + delta_gr, iir_gr_q12)),
        gain_cap_q12,
    )
    pending_gb_q12 = clamp_gain_q12(
        max(prev_gb_q12 - delta_gb, min(prev_gb_q12 + delta_gb, iir_gb_q12)),
        gain_cap_q12,
    )
    pending_y_low = min(found_y_low, 24)
    pending_y_high = max(found_y_high, 220)
    pending_e_th = max(8, min(160, found_e_th))

    return AwbFrameResult(
        block_r_u8=block_r_u8,
        block_g_u8=block_g_u8,
        block_b_u8=block_b_u8,
        block_y_luma_u8=block_y_luma_u8,
        block_weight_u4=block_weight_u4,
        mask_valid=mask_valid,
        mask_sat=mask_sat,
        edge_mag_u10=edge_mag_u10,
        y_hist=y_hist,
        e_hist=e_hist,
        pending_gr_q12=pending_gr_q12,
        pending_gg_q12=prev_gg_q12,
        pending_gb_q12=pending_gb_q12,
        pending_y_low=pending_y_low,
        pending_y_high=pending_y_high,
        pending_e_th=pending_e_th,
        conf_sog=next_conf_sog,
        conf_edge=next_conf_edge,
        hold=hold,
        scene_change=scene_change,
        count_all=snap_count_all,
        count_valid=snap_count_valid,
        count_edge=snap_count_edge,
        count_sat=snap_count_sat,
        sum_y=snap_sum_y,
        mean_y_bucket=mean_y_cur,
        gw_r=snap_gw_r,
        gw_g=snap_gw_g,
        gw_b=snap_gw_b,
        raw_target_gr_q12=raw_target_gr_q12,
        raw_target_gb_q12=raw_target_gb_q12,
        target_gr_q12=target_gr_q12,
        target_gb_q12=target_gb_q12,
        valid_ratio_pm=valid_ratio_pm,
        gain_cap_q12=gain_cap_q12,
        scene_dominant=scene_dominant,
        hold_reason=hold_reason,
        gain_step_q12=max(delta_gr, delta_gb),
    )


def demosaic_bilinear(mosaic_u12: np.ndarray, bayer_name: str) -> np.ndarray:
    bayer_name = _normalize_bayer_name(bayer_name)
    raw = mosaic_u12.astype(np.float32) / 4095.0
    h, w = raw.shape
    r_mask = np.zeros((h, w), dtype=np.float32)
    g_mask = np.zeros((h, w), dtype=np.float32)
    b_mask = np.zeros((h, w), dtype=np.float32)

    if bayer_name == "RGGB":
        r_mask[0::2, 0::2] = 1.0
        g_mask[0::2, 1::2] = 1.0
        g_mask[1::2, 0::2] = 1.0
        b_mask[1::2, 1::2] = 1.0
    elif bayer_name == "GRBG":
        g_mask[0::2, 0::2] = 1.0
        r_mask[0::2, 1::2] = 1.0
        b_mask[1::2, 0::2] = 1.0
        g_mask[1::2, 1::2] = 1.0
    elif bayer_name == "GBRG":
        g_mask[0::2, 0::2] = 1.0
        b_mask[0::2, 1::2] = 1.0
        r_mask[1::2, 0::2] = 1.0
        g_mask[1::2, 1::2] = 1.0
    elif bayer_name == "BGGR":
        b_mask[0::2, 0::2] = 1.0
        g_mask[0::2, 1::2] = 1.0
        g_mask[1::2, 0::2] = 1.0
        r_mask[1::2, 1::2] = 1.0

    kernel = np.array(
        [
            [1.0, 2.0, 1.0],
            [2.0, 4.0, 2.0],
            [1.0, 2.0, 1.0],
        ],
        dtype=np.float32,
    )

    def interp(mask: np.ndarray) -> np.ndarray:
        weighted = ndimage.convolve(raw * mask, kernel, mode="mirror")
        norm = ndimage.convolve(mask, kernel, mode="mirror")
        return np.divide(weighted, np.maximum(norm, 1e-6))

    rgb = np.stack([interp(r_mask), interp(g_mask), interp(b_mask)], axis=-1)
    return np.clip(rgb, 0.0, 1.0)


def apply_rgb_gain_preview(rgb_linear: np.ndarray, gr_q12: int, gg_q12: int, gb_q12: int) -> np.ndarray:
    gains = np.array([gr_q12, gg_q12, gb_q12], dtype=np.float32) / float(Q12_ONE)
    corrected = rgb_linear * gains[None, None, :]
    return np.clip(corrected, 0.0, 1.0)


def display_tone_map(rgb_linear: np.ndarray, percentile: float = 99.5, gamma: float = 1 / 2.2) -> np.ndarray:
    scale = np.percentile(rgb_linear, percentile)
    scale = max(float(scale), 1e-6)
    mapped = np.clip(rgb_linear / scale, 0.0, 1.0)
    return np.power(mapped, gamma)
