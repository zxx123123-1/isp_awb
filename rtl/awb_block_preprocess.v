module bayer_block_proc
#(
    parameter BLOCKS_PER_CYCLE = 2,
    parameter COORD_WIDTH      = 16,
    parameter DATA_WIDTH_IN    = 12,
    parameter DATA_WIDTH_OUT   = 8,
    parameter STAT_SHIFT       = 4
)(
    // 时钟 & 复位
    input                        pclk,
    input                        rst_n,

    // 图像输入数据
    input [DATA_WIDTH_IN*4 - 1:0] in_data,
    input                        in_valid,
    input                        in_sof,
    input                        in_eol,

    // 块输出信号
    output reg                                              block_valid ,
    output reg [BLOCKS_PER_CYCLE*COORD_WIDTH - 1:0]         block_x     ,
    output reg [COORD_WIDTH - 1:0]                          block_y     ,
    output reg [BLOCKS_PER_CYCLE*DATA_WIDTH_OUT - 1:0]      block_r     ,
    output reg [BLOCKS_PER_CYCLE*DATA_WIDTH_OUT - 1:0]      block_g     ,
    output reg [BLOCKS_PER_CYCLE*DATA_WIDTH_OUT - 1:0]      block_b     ,
    output reg [BLOCKS_PER_CYCLE*DATA_WIDTH_OUT - 1:0]      block_y_luma,
    output reg [BLOCKS_PER_CYCLE - 1:0]                     mask_valid  ,
    output reg [BLOCKS_PER_CYCLE - 1:0]                     mask_sat    ,
    output reg [3:0]                                        block_weight,

    // 帧标志信号
    output reg                         frame_start,
    output reg                         frame_end,

    // 配置参数输入
    input                        soft_rst,
    input [7:0]                  y_low,
    input [7:0]                  y_high,
    input [1:0]                  bayer_pattern,
    input [15:0]                 img_width,
    input [15:0]                 img_height,
    input [15:0]                 rg_lo_q8,
    input [15:0]                 rg_hi_q8,
    input [15:0]                 bg_lo_q8,
    input [15:0]                 bg_hi_q8,
    input [7:0]                  sat_th,
    input [3:0]                  top_weight,
    input [3:0]                  normal_weight
);

// ===================== 内部逻辑写在这里 =====================

// 行计数器和像素计数器
reg [COORD_WIDTH - 1:0] line_cnt,pixel_cnt;
wire [COORD_WIDTH - 1:0] block_col_cnt;

// 块信号以及帧控制信号
reg [BLOCKS_PER_CYCLE*COORD_WIDTH - 1:0] block_x_r1,block_x_r2;
reg [COORD_WIDTH - 1:0] block_y_r1,block_y_r2;
reg [DATA_WIDTH_IN*4 - 1:0] dina_d1,dina_d2;
reg block_valid_r1, block_valid_r2;
reg frame_start_r1, frame_start_r2;
reg in_eol_d1, in_eol_d2;

// bram输出信号
reg [DATA_WIDTH_IN*4 - 1:0] douta;

always@(posedge pclk) begin
    if(!rst_n) line_cnt <= 0;
    else if(in_sof) line_cnt <= 0;
    else if(in_eol) line_cnt <= line_cnt + 1'b1;
end

always@(posedge pclk) begin
    if(!rst_n) pixel_cnt <= 0;
    else if(in_sof) pixel_cnt <= 0;
    else if(in_valid) pixel_cnt <= pixel_cnt + 4;
end

assign block_col_cnt = {2'b0,pixel_cnt[COORD_WIDTH-1:2]};

// 打拍处理，对齐Bram读取两拍延迟，模块输出一拍延迟
always@(posedge pclk)begin
    if(!rst_n) begin 
        block_x_r1 <= 0;
        block_x_r2 <= 0;
        block_x <= 0;
        block_y_r1 <= 0;
        block_y_r2 <= 0;
        block_y <= 0;
        dina_d1 <= 0;  
        dina_d2 <= 0;
        block_valid_r1 <= 1'b0;
        block_valid_r2 <= 1'b0;     
        block_valid <= 1'b0;           
        frame_start_r1 <= 1'b0;
        frame_start_r2 <= 1'b0;
        frame_start <= 1'b0;
        in_eol_d1 <= 1'b0;
        in_eol_d2 <= 1'b0;
    end
    else  begin 
        block_x_r1 <= {block_col_cnt+1'b1, block_col_cnt};
        block_x_r2 <= block_x_r1;
        block_x <= block_x_r2;        
        block_y_r1 <= line_cnt;        
        block_y_r2 <= block_y_r1;
        block_y <= block_y_r2;
        dina_d1 <= in_data;
        dina_d2 <= dina_d1;
        block_valid_r1 <= in_valid;
        block_valid_r2 <= block_valid_r1;
        block_valid <= block_valid_r2;
        frame_start_r1 <= in_sof;
        frame_start_r2 <= frame_start_r1;
        frame_start <= frame_start_r2;
        in_eol_d1 <= in_eol;
        in_eol_d2 <= in_eol_d1;
    end
end


always@(posedge pclk)begin
    if(!rst_n) block_weight<=normal_weight;
    else if(block_y_r2<img_height/5) block_weight<=top_weight;
    else block_weight<=normal_weight;
end

always@(posedge pclk)begin
    if(!rst_n) frame_end <= 1'b0;
    else if(in_eol_d2 && (line_cnt == img_height-1)) frame_end <= 1'b1;
    else frame_end <= 1'b0;
end


// 512*48bit的单端口bram:，其中读端口延迟两拍
//只在偶数行写入 BRAM，形成上一行缓冲
blk_mem_gen_0 blk_mem_gen_0_inst0(
  .clka(pclk),    // input wire clka
  .ena(rst_n),      // input wire ena
  .wea(~line_cnt[0]&in_valid),      // input wire [0 : 0] wea
  .addra(block_col_cnt[9:1]),  // input wire [8 : 0] addra
  .dina(in_data),    // input wire [47 : 0] dina
  .douta(douta)  // output wire [47 : 0] douta
);

// rgb以及亮度
reg  [DATA_WIDTH_IN - 1:0] r0,b0,g0,r1,b1,g1;
wire [DATA_WIDTH_OUT - 1:0] r0_8,b0_8,g0_8,r1_8,b1_8,g1_8;
wire [DATA_WIDTH_OUT + 1:0] sum0,sum1;
wire [DATA_WIDTH_OUT - 1:0] y0_8,y1_8;

//产生掩码
wire [BLOCKS_PER_CYCLE - 1:0] valid_luma,valid_sat,valid_rg,valid_bg,reject_red, reject_blue;
wire [7:0] max0_rgb,max1_rgb;
wire [15:0] rg1_16, bg1_16, rg0_16, bg0_16;
wire [9:0] r1_10,b1_10,r0_10,b0_10;
wire [11:0] r1_12,b1_12,r0_12,b0_12;

//拜尔图案解码
always@(*)begin
    case(bayer_pattern)
        2'b00:begin
            r0 = douta[DATA_WIDTH_IN*1-1:0];
            g0 = (douta[DATA_WIDTH_IN*2-1:DATA_WIDTH_IN*1]+dina_d2[DATA_WIDTH_IN*1-1:0]) >> 1;
            b0 = dina_d2[DATA_WIDTH_IN*2-1:DATA_WIDTH_IN*1];
            r1 = douta[DATA_WIDTH_IN*3-1:DATA_WIDTH_IN*2];
            g1 = (douta[DATA_WIDTH_IN*4-1:DATA_WIDTH_IN*3]+dina_d2[DATA_WIDTH_IN*3-1:DATA_WIDTH_IN*2]) >> 1;
            b1 = dina_d2[DATA_WIDTH_IN*4-1:DATA_WIDTH_IN*3];
        end
        2'b01:begin
            r0 = douta[DATA_WIDTH_IN*2-1:DATA_WIDTH_IN*1];
            g0 = (douta[DATA_WIDTH_IN*1-1:0]+dina_d2[DATA_WIDTH_IN*2-1:DATA_WIDTH_IN*1]) >> 1;
            b0 = dina_d2[DATA_WIDTH_IN*1-1:DATA_WIDTH_IN*0];
            r1 = dina_d2[DATA_WIDTH_IN*4-1:DATA_WIDTH_IN*3];
            g1 = (douta[DATA_WIDTH_IN*3-1:DATA_WIDTH_IN*2]+dina_d2[DATA_WIDTH_IN*4-1:DATA_WIDTH_IN*3]) >> 1;
            b1 = dina_d2[DATA_WIDTH_IN*3-1:DATA_WIDTH_IN*2];
        end
        2'b10:begin
            r0 = dina_d2[DATA_WIDTH_IN*1-1:0];
            g0 = (douta[DATA_WIDTH_IN*1-1:0]+dina_d2[DATA_WIDTH_IN*2-1:DATA_WIDTH_IN*1]) >> 1;
            b0 = douta[DATA_WIDTH_IN*2-1:DATA_WIDTH_IN*1];
            r1 = dina_d2[DATA_WIDTH_IN*3-1:DATA_WIDTH_IN*2];
            g1 = (douta[DATA_WIDTH_IN*3-1:DATA_WIDTH_IN*2]+dina_d2[DATA_WIDTH_IN*4-1:DATA_WIDTH_IN*3]) >> 1;
            b1 = douta[DATA_WIDTH_IN*4-1:DATA_WIDTH_IN*3];
        end
        2'b11:begin
            r0 = dina_d2[DATA_WIDTH_IN*2-1:DATA_WIDTH_IN*1];
            g0 = (douta[DATA_WIDTH_IN*2-1:DATA_WIDTH_IN*1]+dina_d2[DATA_WIDTH_IN*1-1:DATA_WIDTH_IN*0]) >> 1;
            b0 = douta[DATA_WIDTH_IN*1-1:DATA_WIDTH_IN*0];
            r1_ = dina_d2[DATA_WIDTH_IN*4-1:DATA_WIDTH_IN*3];
            g1 = (douta[DATA_WIDTH_IN*4-1:DATA_WIDTH_IN*3]+dina_d2[DATA_WIDTH_IN*3-1:DATA_WIDTH_IN*2]) >> 1;
            b1 = douta[DATA_WIDTH_IN*3-1:DATA_WIDTH_IN*2];
        end
    endcase
end

assign r0_8 = clip_shift_u8(r0);
assign g0_8 = clip_shift_u8(g0);
assign b0_8 = clip_shift_u8(b0);
assign r1_8 = clip_shift_u8(r1);
assign g1_8 = clip_shift_u8(g1);
assign b1_8 = clip_shift_u8(b1);
assign sum0 = r0_8 + (g0_8 << 1) + b0_8;
assign sum1 = r1_8 + (g1_8 << 1) + b1_8;
assign y0_8 = sum0 >> 2;
assign y1_8 = sum1 >> 2;

assign max0_rgb = (r0_8 > g0_8) ? ((r0_8 > b0_8) ? r0_8 : b0_8) : ((g0_8 > b0_8) ? g0_8 : b0_8);
assign max1_rgb = (r1_8 > g1_8) ? ((r1_8 > b1_8) ? r1_8 : b1_8) : ((g1_8 > b1_8) ? g1_8 : b1_8);
assign valid_luma = {(y1_8 > y_low) && (y1_8 < y_high), (y0_8 > y_low) && (y0_8 < y_high)};
assign valid_sat = {(max1_rgb < sat_th), (max0_rgb < sat_th)};
assign rg1_16 = {r1_8,8'b0};
assign bg1_16 = {b1_8,8'b0};
assign rg0_16 = {r0_8,8'b0};
assign bg0_16 = {b0_8,8'b0};
assign valid_rg = {(rg1_16 > rg_lo_q8*g1_8) && (rg1_16 < rg_hi_q8*g1_8), (rg0_16 > rg_lo_q8*g0_8) && (rg0_16 < rg_hi_q8*g0_8)};//(R << 8) 在 [rg_lo_q8 * G, rg_hi_q8 * G] 之间
assign valid_bg = {(bg1_16 > bg_lo_q8*g1_8) && (bg1_16 < bg_hi_q8*g1_8), (bg0_16 > bg_lo_q8*g0_8) && (bg0_16 < bg_hi_q8*g0_8)};//(B << 8) 在 [bg_lo_q8 * G, bg_hi_q8 * G] 之间
assign r1_10 = {r1_8,2'b0};
assign b1_10 = {b1_8,2'b0};
assign r0_10 = {r0_8,2'b0};
assign b0_10 = {b0_8,2'b0};
assign r1_12 = {r1_8,4'b0};
assign b1_12 = {b1_8,4'b0};
assign r0_12 = {r0_8,4'b0};
assign b0_12 = {b0_8,4'b0};
assign reject_red = {(r1_12 > 9*g1_8) && (r1_10 > 3*b1_8), (r0_12 > 9*g0_8) && (r0_10 > 3*b0_8)};//(R4 > G9) && (R2 > B3),红色异常
assign reject_blue = {(b1_12 > 9*g1_8) && (b1_10 > 3*r1_8), (b0_12 > 9*g0_8) && (b0_10 > 3*r0_8)};//(B4 > G9) && (B2 > R3),蓝色异常

always@(posedge pclk)begin
    if(!rst_n) mask_valid[0] <= 1'b0;
    else if(valid_luma[0] & valid_sat[0] & valid_rg[0] & valid_bg[0] & ~reject_red[0] & ~reject_blue[0])
        mask_valid[0] <= 1'b1;
    else
        mask_valid[0] <= 1'b0;
end

always@(posedge pclk)begin
    if(!rst_n) mask_valid[1] <= 1'b0;
    else if(valid_luma[1] & valid_sat[1] & valid_rg[1] & valid_bg[1] & ~reject_red[1] & ~reject_blue[1])
        mask_valid[1] <= 1'b1;
    else
        mask_valid[1] <= 1'b0;
end

always@(posedge pclk)begin
    if(!rst_n) mask_sat[0] <= 1'b0;
    else if(valid_sat[0])
        mask_sat[0] <= 1'b0;
    else
        mask_sat[0] <= 1'b1;
end

always@(posedge pclk)begin
    if(!rst_n) mask_sat[1] <= 1'b0;
    else if(valid_sat[1])
        mask_sat[1] <= 1'b0;
    else
        mask_sat[1] <= 1'b1;
end

always@(posedge pclk)begin
    if(!rst_n) begin
        block_r <= 1'b0;
        block_g <= 1'b0;
        block_b <= 1'b0;
        block_y_luma <= 1'b0;
    end
    else begin
        block_r <= {r1_8,r0_8};
        block_g <= {g1_8,g0_8};
        block_b <= {b1_8,b0_8};
        block_y_luma <= {y1_8,y0_8};
    end
end

// 将原始数据裁剪为8位输出数据。
function [7:0] clip_shift_u8;
    input [15:0] value;
    reg [15:0] shifted;
    begin
        shifted = value >> STAT_SHIFT;  
        if (shifted[15:8] != 0)  clip_shift_u8 = 8'hff;      
        else  clip_shift_u8 = shifted[7:0]; 
    end
endfunction

endmodule