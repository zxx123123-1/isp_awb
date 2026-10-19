module awb_core_top #(
    // 直方图参数
    parameter HIST_BINS              = 64,
    parameter Y_BIN_SHIFT            = 2,
    parameter E_BIN_SHIFT            = 4,
    parameter EDGE_Y_TH              = 24,

    // 白平衡增益参数 Q12
    parameter GAIN_MIN_Q12           = 2048,
    parameter GAIN_MAX_Q12           = 12288,
    parameter GAIN_TRUST_Q12         = 7373,

    // 置信度
    parameter LOW_CONF_RATIO_PM      = 400,

    // 位宽参数
    parameter COORD_WIDTH            = 16,
    parameter DATA_WIDTH_IN          = 12,
    parameter DATA_WIDTH_OUT         = 8,
    parameter STAT_SHIFT             = 4,
    parameter BLOCKS_PER_CYCLE       = 2,

    // 亮度分段阈值
    parameter Y_BIN_VAL_LOW          = 16,
    parameter Y_BIN_VAL_MID_LOW      = 48,
    parameter Y_BIN_VAL_MID_HIGH     = 96,
    parameter Y_BIN_VAL_HIGH         = 160,

    //查找失败默认值
    parameter Y_HIST_LOW_DEFAULT_RET = 4;        
    parameter Y_HIST_HIGH_DEFAULT_RET= 250;
    parameter E_HIST_TH_DEFAULT_RET  = 24;

    //阈值钳位界限
    parameter Y_LOW_CLAMP_MAX        = 24;       
    parameter Y_HIGH_CLAMP_MIN       = 220;     
    parameter E_TH_CLAMP_MIN         = 8;        
    parameter E_TH_CLAMP_MAX         = 160;  

    // IIR滤波移位
    parameter IIR_SHIFT_SCENE_CHANGE = 2,
    parameter IIR_SHIFT_LOW_CONF     = 5,
    parameter IIR_SHIFT_NORMAL       = 4
)(
    // AXI-Stream 时钟与复位
    input                        s_axis_aclk,
    input                        s_axis_aresetn,

    // AXI-Stream 从端口
    input  [DATA_WIDTH_IN*4 -1:0] s_axis_tdata,
    input                        s_axis_tvalid,
    output                       s_axis_tready,
    input                        s_axis_tlast,
    input                        s_axis_tuser,

    // Pending 计算结果输出
    output reg [15:0]            pending_gr_q12,
    output reg [15:0]            pending_gb_q12,
    output reg [15:0]            pending_gg_q12,
    output reg [1:0]             pending_conf_sog,
    output reg [1:0]             pending_conf_edge,
    output reg                   pending_hold,
    output reg                   pending_scene_change,
    output reg                   pending_valid,

    // 状态输出
    output reg                   frame_start,
    output reg                   frame_end,

    /*------------- 动态配置输入信号--------------*/
    //图像基础配置
    input  [1:0]                 bayer_pattern,
    input  [15:0]                img_width,
    input  [15:0]                img_height,

    //控制信号
    input                        soft_rst,
    input                        edge_en,

    //像素判断阈值配置
    input  [15:0]                rg_lo_q8,
    input  [15:0]                rg_hi_q8,
    input  [15:0]                bg_lo_q8,
    input  [15:0]                bg_hi_q8,
    input  [7:0]                 sat_th,

    //块权重
    input                        top_weight,
    input  [1:0]                 normal_weight,

    //置信度参数
    input  [11:0]                conf_sog_strong_pm,
    input  [11:0]                conf_sog_med_pm,
    input  [11:0]                conf_sog_weak_pm,
    input  [11:0]                conf_edge_strong_pm,
    input  [11:0]                conf_edge_med_pm,
    input  [11:0]                conf_edge_weak_pm
);

// ===================== 内部逻辑写在这里 =====================
// 计算握手信号
wire handshake;
assign s_axis_tready = 1'b1;
assign handshake=s_axis_tready&&s_axis_tvalid;

// 块信号
wire                                              block_valid ;
wire [BLOCKS_PER_CYCLE*COORD_WIDTH - 1:0]         block_x     ;
wire [COORD_WIDTH - 1:0]                          block_y     ;
wire [BLOCKS_PER_CYCLE*DATA_WIDTH_OUT - 1:0]      block_r     ; 
wire [BLOCKS_PER_CYCLE*DATA_WIDTH_OUT - 1:0]      block_g     ;
wire [BLOCKS_PER_CYCLE*DATA_WIDTH_OUT - 1:0]      block_b     ;
wire [BLOCKS_PER_CYCLE*DATA_WIDTH_OUT - 1:0]      block_y_luma;
wire [BLOCKS_PER_CYCLE - 1:0]                     mask_valid  ;
wire [BLOCKS_PER_CYCLE - 1:0]                     mask_sat    ;
wire [3:0]                                        block_weight;
wire [7:0]                        pending_y_low,pending_y_high;


//例化awb_block_preprocess
awb_block_preprocess
#(
    .BLOCKS_PER_CYCLE (BLOCKS_PER_CYCLE),
    .COORD_WIDTH      (COORD_WIDTH),
    .DATA_WIDTH_IN    (DATA_WIDTH_IN),
    .DATA_WIDTH_OUT   (DATA_WIDTH_OUT),
    .STAT_SHIFT       (STAT_SHIFT)
)
u_awb_block_preprocess
(
    // 时钟 & 复位
    .pclk      (s_axis_aclk),
    .rst_n     (s_axis_aresetn),

    // 图像输入数据
    .in_data   (s_axis_tdata),
    .in_valid  (handshake),
    .in_sof    (handshake&&s_axis_tuser),
    .in_eol    (handshake&&s_axis_tlast),

    // 块输出信号
    .block_valid    (block_valid),
    .block_x        (block_x),
    .block_y        (block_y),
    .block_r        (block_r),
    .block_g        (block_g),
    .block_b        (block_b),
    .block_y_luma   (block_y_luma),
    .mask_valid     (mask_valid),
    .mask_sat       (mask_sat),
    .block_weight   (block_weight),

    // 帧标志信号
    .frame_start    (frame_start),
    .frame_end      (frame_end),

    // 配置参数输入
    .soft_rst       (soft_rst),
    .y_low          (pending_y_low),
    .y_high         (pending_y_high),
    .bayer_pattern  (bayer_pattern),
    .img_width      (img_width),
    .img_height     (img_height),
    .rg_lo_q8       (rg_lo_q8),
    .rg_hi_q8       (rg_hi_q8),
    .bg_lo_q8       (bg_lo_q8),
    .bg_hi_q8       (bg_hi_q8),
    .sat_th         (sat_th),
    .top_weight     (top_weight),
    .normal_weight  (normal_weight)
);



//例化awb_stats_gain_ctrl
awb_stats_gain_ctrl
#(
    .HIST_BINS              (HIST_BINS),
    .Y_BIN_SHIFT            (Y_BIN_SHIFT),
    .E_BIN_SHIFT            (E_BIN_SHIFT),
    .EDGE_Y_TH              (EDGE_Y_TH),
    .GAIN_MIN_Q12           (GAIN_MIN_Q12),
    .GAIN_MAX_Q12           (GAIN_MAX_Q12),
    .GAIN_TRUST_Q12         (GAIN_TRUST_Q12),
    .LOW_CONF_RATIO_PM      (LOW_CONF_RATIO_PM),
    .BLOCKS_PER_CYCLE       (BLOCKS_PER_CYCLE),
    .COORD_WIDTH            (COORD_WIDTH),
    .DATA_WIDTH_OUT         (DATA_WIDTH_OUT),
    .Y_HIST_LOW_DEFAULT_RET (Y_HIST_LOW_DEFAULT_RET),
    .Y_HIST_HIGH_DEFAULT_RET(Y_HIST_HIGH_DEFAULT_RET),
    .E_HIST_TH_DEFAULT_RET  (E_HIST_TH_DEFAULT_RET),
    .Y_LOW_CLAMP_MAX        (Y_LOW_CLAMP_MAX),
    .Y_HIGH_CLAMP_MIN       (Y_HIGH_CLAMP_MIN),
    .E_TH_CLAMP_MIN         (E_TH_CLAMP_MIN),
    .E_TH_CLAMP_MAX         (E_TH_CLAMP_MAX),
    .Y_BIN_VAL_LOW          (Y_BIN_VAL_LOW),
    .Y_BIN_VAL_MID_LOW      (Y_BIN_VAL_MID_LOW),
    .Y_BIN_VAL_MID_HIGH     (Y_BIN_VAL_MID_HIGH),
    .Y_BIN_VAL_HIGH         (Y_BIN_VAL_HIGH),
    .IIR_SHIFT_SCENE_CHANGE (IIR_SHIFT_SCENE_CHANGE),
    .IIR_SHIFT_LOW_CONF     (IIR_SHIFT_LOW_CONF),
    .IIR_SHIFT_NORMAL       (IIR_SHIFT_NORMAL)
)
u_awb_stats_gain_ctrl
(
    // 时钟、复位
    .pclk                   (pclk),
    .rst_n                  (rst_n),
    .soft_rst               (soft_rst),

    // 控制信号输入
    .edge_en                (edge_en),
    .frame_start            (frame_start),
    .frame_end              (frame_end),
    .block_valid            (block_valid),

    // block坐标、像素数据输入
    .block_x                (block_x),
    .block_y                (block_y),
    .block_r                (block_r),
    .block_g                (block_g),
    .block_b                (block_b),
    .block_y_luma           (block_y_luma),

    // mask相关
    .mask_valid             (mask_valid),
    .mask_sat               (mask_sat),
    .block_weight           (block_weight),

    // 图像动态配置参数
    .img_width              (img_width),
    .img_height             (img_height),
    .conf_sog_strong_pm     (conf_sog_strong_pm),
    .conf_sog_med_pm        (conf_sog_med_pm),
    .conf_sog_weak_pm       (conf_sog_weak_pm),
    .conf_edge_strong_pm    (conf_edge_strong_pm),
    .conf_edge_med_pm       (conf_edge_med_pm),
    .conf_edge_weak_pm      (conf_edge_weak_pm),

    // 输出信号
    .pending_y_low          (pending_y_low),
    .pending_y_high         (pending_y_high),
    .pending_gr_q12         (pending_gr_q12),
    .pending_gb_q12         (pending_gb_q12),
    .pending_gg_q12         (pending_gg_q12),
    .pending_valid          (pending_valid),
    .pending_conf_sog       (pending_conf_sog),
    .pending_conf_edge      (pending_conf_edge),
    .pending_hold           (pending_hold),
    .pending_scene_change   (pending_scene_change)
);



endmodule