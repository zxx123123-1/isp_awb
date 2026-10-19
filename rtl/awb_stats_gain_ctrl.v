module awb_stats_gain_ctrl
#(
    parameter BLOCKS_PER_CYCLE       = 2,
    parameter COORD_WIDTH            = 16,
    parameter DATA_WIDTH_OUT         = 8,

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
    parameter DATA_WIDTH_OUT         = 8,
    parameter BLOCKS_PER_CYCLE       = 2,

    //查找失败默认值
    parameter Y_HIST_LOW_DEFAULT_RET = 4;        
    parameter Y_HIST_HIGH_DEFAULT_RET= 250;
    parameter E_HIST_TH_DEFAULT_RET  = 24;

    //阈值钳位界限
    parameter Y_LOW_CLAMP_MAX        = 24;       
    parameter Y_HIGH_CLAMP_MIN       = 220;     
    parameter E_TH_CLAMP_MIN         = 8;        
    parameter E_TH_CLAMP_MAX         = 160;    

    // 亮度分段阈值
    parameter Y_BIN_VAL_LOW          = 16,
    parameter Y_BIN_VAL_MID_LOW      = 48,
    parameter Y_BIN_VAL_MID_HIGH     = 96,
    parameter Y_BIN_VAL_HIGH         = 160,

    // IIR滤波移位
    parameter IIR_SHIFT_SCENE_CHANGE = 2,
    parameter IIR_SHIFT_LOW_CONF     = 5,
    parameter IIR_SHIFT_NORMAL       = 4
)
(
    // 时钟、复位
    input                                    pclk,
    input                                    rst_n,
    input                                    soft_rst,

    // 控制信号输入
    input                                    edge_en,
    input                                    frame_start,
    input                                    frame_end,
    input                                    block_valid,

    // block坐标、像素数据输入
    input   [BLOCKS_PER_CYCLE*COORD_WIDTH    -1 : 0] block_x,
    input   [COORD_WIDTH                     -1 : 0] block_y,
    input   [BLOCKS_PER_CYCLE*DATA_WIDTH_OUT -1 : 0] block_r,
    input   [BLOCKS_PER_CYCLE*DATA_WIDTH_OUT -1 : 0] block_g,
    input   [BLOCKS_PER_CYCLE*DATA_WIDTH_OUT -1 : 0] block_b,
    input   [BLOCKS_PER_CYCLE*DATA_WIDTH_OUT -1 : 0] block_y_luma,

    // mask相关
    input   [BLOCKS_PER_CYCLE -1 : 0]        mask_valid,
    input   [BLOCKS_PER_CYCLE -1 : 0]        mask_sat,
    input   [3:0]                            block_weight,

    // 图像动态配置参数
    input   [15:0]                           img_width          , //动态
    input   [15:0]                           img_height         , //动态
    input   [11:0]                           conf_sog_strong_pm ,  //动态
    input   [11:0]                           conf_sog_med_pm    ,  //动态
    input   [11:0]                           conf_sog_weak_pm   ,    //动态
    input   [11:0]                           conf_edge_strong_pm,  //动态
    input   [11:0]                           conf_edge_med_pm   ,  //动态
    input   [11:0]                           conf_edge_weak_pm  ,   //动态

    // 输出信号
    output reg  [7:0]                            pending_y_low,        //反扫
    output reg  [7:0]                            pending_y_high,       //反扫
    output reg  [15:0]                           pending_gr_q12,
    output reg  [15:0]                           pending_gb_q12,
    output reg  [15:0]                           pending_gg_q12,
    output reg                                   pending_valid,
    output reg  [1:0]                            pending_conf_sog,
    output reg  [1:0]                            pending_conf_edge,
    output reg                                   pending_hold,
    output reg                                   pending_scene_change
);

// 内部逻辑
//打拍处理，对齐edge，BRAM两拍延迟，输出一拍延迟
wire [3*BLOCKS_PER_CYCLE*DATA_WIDTH_OUT -1 : 0] block_data;
reg  [3*BLOCKS_PER_CYCLE*DATA_WIDTH_OUT -1 : 0] block_data_d1, block_data_d2,block_data_d3;
reg [BLOCKS_PER_CYCLE*COORD_WIDTH-1 : 0] block_x_d1, block_x_d2,block_x_d3;
reg [COORD_WIDTH-1 : 0] block_y_d1, block_y_d2,block_y_d3;
reg [BLOCKS_PER_CYCLE*DATA_WIDTH_OUT -1 : 0] block_y_luma_d1, block_y_luma_d2,block_y_luma_d3;
reg block_valid_d1, block_valid_d2, block_valid_d3;
reg frame_start_d1, frame_start_d2,frame_start_d3;
reg frame_end_d1, frame_end_d2,frame_end_d3;
reg [BLOCKS_PER_CYCLE -1 : 0] mask_valid_d1, mask_valid_d2,mask_valid_d3;
reg [BLOCKS_PER_CYCLE -1 : 0] mask_sat_d1, mask_sat_d2,mask_sat_d3;
reg [3:0] block_weight_d1, block_weight_d2,block_weight_d3;


wire [47:0] doutb;

assign block_data = {block_r, block_g, block_b};

always@(posedge pclk) 
    if(!rst_n) begin
        block_data_d1 <= 0;
        block_data_d2 <= 0;
        block_data_d3 <= 0;
        block_valid_d1 <= 1'b0;
        block_valid_d2 <= 1'b0;
        block_valid_d3 <= 1'b0;
        block_y_luma_d1 <= 0;
        block_y_luma_d2 <= 0;
        block_y_luma_d3 <= 0;
        block_x_d1 <= 0;
        block_x_d2 <= 0;
        block_x_d3 <= 0;
        block_y_d1 <= 0;
        block_y_d2 <= 0;
        block_y_d3 <= 0;
        frame_start_d1 <= 1'b0;
        frame_start_d2 <= 1'b0;
        frame_start_d3 <= 1'b0;
        frame_end_d1 <= 1'b0;
        frame_end_d2 <= 1'b0;
        frame_end_d3 <= 1'b0;
        mask_valid_d1 <= 0;
        mask_valid_d2 <= 0;
        mask_valid_d3 <= 0;
        mask_sat_d1 <= 0;
        mask_sat_d2 <= 0;
        mask_sat_d3 <= 0;
        block_weight_d1 <= 4'd0;
        block_weight_d2 <= 4'd0;
        block_weight_d3 <= 4'd0;
    end else begin
        block_data_d1 <= block_data;
        block_data_d2 <= block_data_d1;
        block_data_d3 <= block_data_d2;
        block_valid_d1 <= block_valid;
        block_valid_d2 <= block_valid_d1;
        block_valid_d3 <= block_valid_d2;
        block_y_luma_d1 <= block_y_luma;
        block_y_luma_d2 <= block_y_luma_d1;
        block_y_luma_d3 <= block_y_luma_d2;
        block_x_d1 <= block_x;
        block_x_d2 <= block_x_d1;
        block_x_d3 <= block_x_d2;
        block_y_d1 <= block_y;
        block_y_d2 <= block_y_d1;
        block_y_d3 <= block_y_d2;
        frame_start_d1 <= frame_start;
        frame_start_d2 <= frame_start_d1;
        frame_start_d3 <= frame_start_d2;
        frame_end_d1 <= frame_end;
        frame_end_d2 <= frame_end_d1;
        frame_end_d3 <= frame_end_d2;
        mask_valid_d1 <= mask_valid;
        mask_valid_d2 <= mask_valid_d1;
        mask_valid_d3 <= mask_valid_d2;
        mask_sat_d1 <= mask_sat;
        mask_sat_d2 <= mask_sat_d1;
        mask_sat_d3 <= mask_sat_d2;
        block_weight_d1 <= block_weight;
        block_weight_d2 <= block_weight_d1;
        block_weight_d3 <= block_weight_d2;
    end

// 512*48bit的简单双口RAM，读延迟为两个周期
blk_mem_gen_1 blk_mem_gen_1_inst (
  .clka(pclk),    // input wire clka
  .ena(!rst_n),      // input wire ena
  .wea(block_valid),      // input wire [0 : 0] wea
  .addra(block_x[9:1]),  // input wire [8 : 0] addra
  .dina(block_data),    // input wire [47 : 0] dina
  .clkb(pclk),    // input wire clkb
  .enb(!rst_n),      // input wire enb
  .addrb(block_x[9:1]),  // input wire [8 : 0] addrb
  .doutb(doutb)  // output wire [47 : 0] doutb
);

/*--------------------产生边缘信号---------------------*/
wire up_valid;
wire [7:0] top_r0,top_g0,top_b0,bot_r0,bot_g0,bot_b0,top_r1,top_g1,top_b1,bot_r1,bot_g1,bot_b1;
wire [7:0] up_r0,up_g0,up_b0,up_r1,up_g1,up_b1;
wire [8:0] d_r0,d_g0,d_b0,d_r1,d_g1,d_b1;
reg [9:0] edge0,edge1;
wire edge_valid0,edge_valid1;

/*-------------------边缘统计信号----------------------------*/
wire [5:0] e_bin0,e_bin1;
wire [31:0] hist_sum_edge;
wire [5:0] hist_bin_edge;
wire out_valid_edge;

/*-------------------亮度统计信号----------------------------*/
wire [7:0] lane0_y,lane1_y;
wire [5:0] y_bin0,y_bin1;
wire [31:0] hist_sum_y;
wire [5:0] hist_bin_y;
wire out_valid_y;

/*-------------------边缘阈值信号----------------------------*/
reg [9:0] pending_e_th;

assign up_valid = block_y_d2 !=0;
assign top_r1 = doutb[3*BLOCKS_PER_CYCLE*DATA_WIDTH_OUT-1:(2*BLOCKS_PER_CYCLE+1)*DATA_WIDTH_OUT];
assign top_r0 = doutb[(2*BLOCKS_PER_CYCLE+1)*DATA_WIDTH_OUT-1:2*BLOCKS_PER_CYCLE*DATA_WIDTH_OUT];
assign top_g1 = doutb[2*BLOCKS_PER_CYCLE*DATA_WIDTH_OUT-1:(BLOCKS_PER_CYCLE+1)*DATA_WIDTH_OUT];
assign top_g0 = doutb[(BLOCKS_PER_CYCLE+1)*DATA_WIDTH_OUT-1:BLOCKS_PER_CYCLE*DATA_WIDTH_OUT];
assign top_b1 = doutb[BLOCKS_PER_CYCLE*DATA_WIDTH_OUT-1:DATA_WIDTH_OUT];
assign top_b0 = doutb[DATA_WIDTH_OUT-1:0];
assign bot_r1 = block_data_d2[3*BLOCKS_PER_CYCLE*DATA_WIDTH_OUT-1:(2*BLOCKS_PER_CYCLE+1)*DATA_WIDTH_OUT];
assign bot_r0 = block_data_d2[(2*BLOCKS_PER_CYCLE+1)*DATA_WIDTH_OUT-1:2*BLOCKS_PER_CYCLE*DATA_WIDTH_OUT];
assign bot_g1 = block_data_d2[2*BLOCKS_PER_CYCLE*DATA_WIDTH_OUT-1:(BLOCKS_PER_CYCLE+1)*DATA_WIDTH_OUT];
assign bot_g0 = block_data_d2[(BLOCKS_PER_CYCLE+1)*DATA_WIDTH_OUT-1:BLOCKS_PER_CYCLE*DATA_WIDTH_OUT];
assign bot_b1 = block_data_d2[BLOCKS_PER_CYCLE*DATA_WIDTH_OUT-1:DATA_WIDTH_OUT];
assign bot_b0 = block_data_d2[DATA_WIDTH_OUT-1:0];
assign up_r0 = up_valid ? top_r0 : bot_r0;
assign up_g0 = up_valid ? top_g0 : bot_g0;
assign up_b0 = up_valid ? top_b0 : bot_b0;
assign up_r1 = up_valid ? top_r1 : bot_r1;
assign up_g1 = up_valid ? top_g1 : bot_g1;
assign up_b1 = up_valid ? top_b1 : bot_b1;
assign d_r0 = {1'b0, abs_diff8(up_r0, bot_r0)};
assign d_g0 = {1'b0, abs_diff8(up_g0, bot_g0)};
assign d_b0 = {1'b0, abs_diff8(up_b0, bot_b0)};
assign d_r1 = abs_diff8(up_r1, bot_r1)+abs_diff8(bot_r0, bot_r1);
assign d_g1 = abs_diff8(up_g1, bot_g1)+abs_diff8(bot_g0, bot_g1);
assign d_b1 = abs_diff8(up_b1, bot_b1)+abs_diff8(bot_b0, bot_b1);

always@(posedge pclk) 
    if(!rst_n) begin
        edge0 <= 10'd0;
        edge1 <= 10'd0;
    end 
    else if(block_valid_d2) begin
        edge0 <= ((d_r0 + d_g0 + d_b0) > 10'h3FF) ? 10'h3FF : (d_r0 + d_g0 + d_b0);
        edge1 <= ((d_r1 + d_g1 + d_b1) > 10'h3FF) ? 10'h3FF : (d_r1 + d_g1 + d_b1);
    end


assign edge_valid0 = block_valid_d3 && edge_en && edge0 > pending_e_th && lane0_y > EDGE_Y_TH;
assign edge_valid1 = block_valid_d3 && edge_en && edge1 > pending_e_th && lane1_y > EDGE_Y_TH;

assign e_bin0 = edge0>>E_BIN_SHIFT;
assign e_bin1 = edge1>>E_BIN_SHIFT;

assign lane0_y = block_y_luma_d3[DATA_WIDTH_OUT-1:0];
assign lane1_y = block_y_luma_d3[BLOCKS_PER_CYCLE*DATA_WIDTH_OUT -1 :DATA_WIDTH_OUT];
assign y_bin0 = lane0_y>>Y_BIN_SHIFT;
assign y_bin1 = lane1_y>>Y_BIN_SHIFT;

awb_hist_stat_scan
#(
    .HIST_BINS        (HIST_BINS),
    .BLOCKS_PER_CYCLE (BLOCKS_PER_CYCLE)
)
u_awb_hist_stat_scan_edge
(
    .pclk      (pclk),
    .rst_n     (rst_n),
    .frame_end (frame_end_d3),
    .in_valid  (block_valid_d3),
    .in_addr0   (e_bin0),
    .in_addr1   (e_bin1),
    .hist_sum  (hist_sum_edge),
    .hist_bin  (hist_bin_edge),
    .out_valid (out_valid_edge)
);

awb_hist_stat_scan
#(
    .HIST_BINS        (HIST_BINS),
    .BLOCKS_PER_CYCLE (BLOCKS_PER_CYCLE)
)
u_awb_hist_stat_scan_y
(
    .pclk      (pclk),
    .rst_n     (rst_n),
    .frame_end (frame_end_d3),
    .in_valid  (block_valid_d3),
    .in_addr0   (y_bin0),
    .in_addr1   (y_bin1),
    .hist_sum  (hist_sum_y),
    .hist_bin  (hist_bin_y),
    .out_valid (out_valid_y)
);

/*---------------------统计结果，以及直方图反扫----------------------------*/
wire [7:0] lane0_r,lane1_r,lane0_g,lane1_g,lane0_b,lane1_b;
wire [23:0] low_target,high_target,edge_target;
wire [9:0] hist_edge;
wire [7:0] hist_y;
reg [9:0] found_e_th;
reg [7:0] found_y_low,found_y_high;
reg y_low_latched, y_high_latched, e_th_latched;
reg [23:0] live_count_all;
reg [31:0] live_count_valid;
reg [31:0] live_count_edge;
reg [31:0] live_count_sat;
reg [31:0] live_sum_y;
reg [31:0] live_gw_r;
reg [31:0] live_gw_g;
reg [31:0] live_gw_b;

assign lane0_r = block_data_d3[3*BLOCKS_PER_CYCLE*DATA_WIDTH_OUT-1:(2*BLOCKS_PER_CYCLE+1)*DATA_WIDTH_OUT];
assign lane1_r = block_data_d3[(2*BLOCKS_PER_CYCLE+1)*DATA_WIDTH_OUT-1:2*BLOCKS_PER_CYCLE*DATA_WIDTH_OUT];
assign lane0_g = block_data_d3[2*BLOCKS_PER_CYCLE*DATA_WIDTH_OUT-1:(BLOCKS_PER_CYCLE+1)*DATA_WIDTH_OUT];
assign lane1_g = block_data_d3[(BLOCKS_PER_CYCLE+1)*DATA_WIDTH_OUT-1:BLOCKS_PER_CYCLE*DATA_WIDTH_OUT];
assign lane0_b = block_data_d3[BLOCKS_PER_CYCLE*DATA_WIDTH_OUT-1:DATA_WIDTH_OUT];
assign lane1_b = block_data_d3[DATA_WIDTH_OUT-1:0];

//frame_start_d3清空逻辑得细考虑***********
always@(posedge pclk) 
    if(!rst_n|| frame_start_d3) begin
        live_count_all <= 24'd0;
        live_count_valid <= 32'd0;
        live_count_edge <= 32'd0;
        live_count_sat <= 32'd0;
        live_sum_y <= 32'd0;
        live_gw_r <= 32'd0;
        live_gw_g <= 32'd0;
        live_gw_b <= 32'd0;
    end 
    else if(block_valid_d3) begin
        live_count_all <= live_count_all + 2;
        live_count_valid <= live_count_valid + mask_valid_d3[0] + mask_valid_d3[1];
        live_count_edge <= live_count_edge + edge_valid0 + edge_valid1;
        live_count_sat <= live_count_sat + mask_sat_d3[0] + mask_sat_d3[1];
        live_sum_y <= live_sum_y + lane0_y + lane1_y;
        live_gw_r <= live_gw_r + lane0_r*block_weight_d3*mask_valid_d3[0] + lane1_r*block_weight_d3*mask_valid_d3[1];
        live_gw_g <= live_gw_g + lane0_g*block_weight_d3*mask_valid_d3[0] + lane1_g*block_weight_d3*mask_valid_d3[1];
        live_gw_b <= live_gw_b + lane0_b*block_weight_d3*mask_valid_d3[0] + lane1_b*block_weight_d3*mask_valid_d3[1];
    end

assign low_target = live_count_all*5/100;
assign high_target = live_count_all*98/100;
assign edge_target = live_count_all*75/100;

assign hist_edge = {hist_bin_edge,{E_BIN_SHIFT{1'b0}}};
assign hist_y = {hist_bin_y,{Y_BIN_SHIFT{1'b0}}};

//锁存第一次满足条件的值,帧结束回归原始  
always @(posedge pclk) begin
    if (!rst_n || frame_end_d3) begin
        found_y_low <= Y_HIST_LOW_DEFAULT_RET;
        y_low_latched <= 1'b0;
    end
    else if(out_valid_y && !y_low_latched && (hist_sum_y >= low_target)) begin
        found_y_low <= hist_y;
        y_low_latched <= 1'b1;
    end
end

always @(posedge pclk) begin
    if (!rst_n || frame_end_d3) begin
        found_y_high <= Y_HIST_HIGH_DEFAULT_RET;
        y_high_latched <= 1'b0;
    end
    else if(out_valid_y && !y_high_latched && (hist_sum_y >= high_target)) begin
        found_y_high <= hist_y;
        y_high_latched <= 1'b1;
    end
end

always @(posedge pclk) begin
    if (!rst_n || frame_end_d3) begin
        found_e_th <= E_HIST_TH_DEFAULT_RET;
        e_th_latched <= 1'b0;
    end
    else if(out_valid_edge && !e_th_latched && (hist_sum_edge >= edge_target)) begin
        found_e_th <= hist_edge;
        e_th_latched <= 1'b1;
    end
end

always@(posedge pclk) 
    if(!rst_n) begin
        pending_y_low <= 8'd0;
        pending_y_high <= 8'd0;
        pending_e_th <= 10'd0;
    end
    else begin
        pending_y_low <= (found_y_low > Y_LOW_CLAMP_MAX) ? Y_LOW_CLAMP_MAX : found_y_low;
        pending_y_high <= (found_y_high < Y_HIGH_CLAMP_MIN) ? Y_HIGH_CLAMP_MIN : found_y_high;
        pending_e_th <= (found_e_th > E_TH_CLAMP_MAX) ? E_TH_CLAMP_MAX: (found_e_th < E_TH_CLAMP_MIN) ? E_TH_CLAMP_MIN : found_e_th;
    end 

/*----------------------第一组信号---------------------------*/   
reg [7:0] mean_y_cur;
reg [7:0] prev_mean_y;
wire dark_scene; 
wire [1:0] conf_sog,conf_edge;
wire [1:0] next_conf_sog,next_conf_edge;
wire hold;

//对齐live信号，延迟一拍
reg frame_end_d4;
reg frame_start_d4;

always@(*)
    if(live_count_all == 24'd0) mean_y_cur = 8'd0;
    else if(live_sum_y < {live_count_all,5'b0}) mean_y_cur = Y_BIN_VAL_LOW;
    else if(live_sum_y < {live_count_all,6'b0}) mean_y_cur = Y_BIN_VAL_MID_LOW;
    else if(live_sum_y < {live_count_all,7'b0}) mean_y_cur = Y_BIN_VAL_MID_HIGH;
    else  mean_y_cur = Y_BIN_VAL_HIGH;

always@(posedge pclk) 
    if(!rst_n) prev_mean_y <= 8'd0;
    else if(frame_start_d4) prev_mean_y <= mean_y_cur;

assign dark_scene = ((live_count_all != 24'd0) && live_sum_y < {live_count_all,5'b0});

assign conf_sog = conf_from_ratio(live_count_valid,live_count_all,conf_sog_strong_pm,conf_sog_med_pm,conf_sog_weak_pm);
assign conf_edge = edge_en ? conf_from_ratio(live_count_edge,live_count_all,conf_edge_strong_pm,conf_edge_med_pm,conf_edge_weak_pm):2'd0;

assign next_conf_sog = (live_count_all != 24'd0) && (live_count_sat * 1000 > live_count_all * 150) && (conf_sog != 2'b0) ? conf_sog - 1'b1 : conf_sog;
assign next_conf_edge = (conf_edge != 2'b0 && dark_scene) ? conf_edge - 1'b1 : conf_edge;

assign hold = (next_conf_sog == 2'b0);

always@(posedge pclk) 
    if(!rst_n) begin 
        frame_end_d4 <= 1'b0;  
        frame_start_d4 <= 1'b0;
    end
    else begin 
        frame_end_d4 <= frame_end_d3;
        frame_start_d4 <= frame_start_d3;
    end

/*----------------------除法信号---------------------------*/    

//有效系数比例除法器信号   
reg s_axis_divisor_tvalid_vld;
wire s_axis_divisor_tready_vld;
wire [24:0] s_axis_divisor_tdata_vld;
reg s_axis_dividend_tvalid_vld;
wire s_axis_dividend_tready_vld;
wire [42:0] s_axis_dividend_tdata_vld;
wire m_axis_dout_tvalid_vld;
wire m_axis_dout_tuser_vld;                    //除数为0信号
wire [42:0] m_axis_dout_tdata_vld;
wire [41:0] tdata_vld;

assign s_axis_divisor_tdata_vld = {1'b0,live_count_all};
assign tdata_vld = live_count_valid * 1000;
assign s_axis_dividend_tdata_vld = {1'b0,tdata_vld};

always@(posedge pclk) 
    if(!rst_n) s_axis_divisor_tvalid_vld <= 1'b0;  
    else if(frame_end_d4) s_axis_divisor_tvalid_vld <= 1'b1;
    else if(s_axis_divisor_tready_vld) s_axis_divisor_tvalid_vld <= 1'b0;

always@(posedge pclk) 
    if(!rst_n) s_axis_dividend_tvalid_vld <= 1'b0;  
    else if(frame_end_d4) s_axis_dividend_tvalid_vld <= 1'b1;
    else if(s_axis_dividend_tready_vld) s_axis_dividend_tvalid_vld <= 1'b0;    

//实际上是42位除以24位，考虑符号位后，43位除以25位，多出的是拓展位
div_gen_1 div_gen_1_vld (
  .aclk(pclk),                                      // input wire aclk
  .s_axis_divisor_tvalid(s_axis_divisor_tvalid_vld),    // input wire s_axis_divisor_tvalid
  .s_axis_divisor_tready(s_axis_divisor_tready_vld),    // output wire s_axis_divisor_tready
  .s_axis_divisor_tdata(s_axis_divisor_tdata_vld),      // input wire [31 : 0] s_axis_divisor_tdata
  .s_axis_dividend_tvalid(s_axis_dividend_tvalid_vld),  // input wire s_axis_dividend_tvalid
  .s_axis_dividend_tready(s_axis_dividend_tready_vld),  // output wire s_axis_dividend_tready
  .s_axis_dividend_tdata(s_axis_dividend_tdata_vld),    // input wire [47 : 0] s_axis_dividend_tdata
  .m_axis_dout_tvalid(m_axis_dout_tvalid_vld),          // output wire m_axis_dout_tvalid
  .m_axis_dout_tuser(m_axis_dout_tuser_vld),            // output wire [0 : 0] m_axis_dout_tuser
  .m_axis_dout_tdata(m_axis_dout_tdata_vld)            // output wire [47 : 0] m_axis_dout_tdata
);

//gr比例除法器信号
reg s_axis_divisor_tvalid_gr;
wire s_axis_divisor_tready_gr;
wire [32:0] s_axis_divisor_tdata_gr;
reg s_axis_dividend_tvalid_gr;
wire s_axis_dividend_tready_gr;
wire [44:0] s_axis_dividend_tdata_gr;
wire m_axis_dout_tvalid_gr;
wire m_axis_dout_tuser_gr;  
wire [44:0] m_axis_dout_tdata_gr;


assign s_axis_divisor_tdata_gr = {1'b0,live_gw_r};
assign s_axis_dividend_tdata_gr = {1'b0,live_gw_g,12'b0};

always@(posedge pclk) 
    if(!rst_n) s_axis_divisor_tvalid_gr <= 1'b0;  
    else if(frame_end_d4) s_axis_divisor_tvalid_gr <= 1'b1;
    else if(s_axis_divisor_tready_gr) s_axis_divisor_tvalid_gr <= 1'b0;

always@(posedge pclk) 
    if(!rst_n) s_axis_dividend_tvalid_gr <= 1'b0;  
    else if(frame_end_d4) s_axis_dividend_tvalid_gr <= 1'b1;
    else if(s_axis_dividend_tready_gr) s_axis_dividend_tvalid_gr <= 1'b0;  


//实际上是44位除以32位，考虑符号位后，45位除以33位，多出的是拓展位
div_gen_0 div_gen_0_gr (
  .aclk(pclk),                                      // input wire aclk
  .s_axis_divisor_tvalid(s_axis_divisor_tvalid_gr),    // input wire s_axis_divisor_tvalid
  .s_axis_divisor_tready(s_axis_divisor_tready_gr),    // output wire s_axis_divisor_tready
  .s_axis_divisor_tdata(s_axis_divisor_tdata_gr),      // input wire [39 : 0] s_axis_divisor_tdata
  .s_axis_dividend_tvalid(s_axis_dividend_tvalid_gr),  // input wire s_axis_dividend_tvalid
  .s_axis_dividend_tready(s_axis_dividend_tready_gr),  // output wire s_axis_dividend_tready
  .s_axis_dividend_tdata(s_axis_dividend_tdata_gr),    // input wire [47 : 0] s_axis_dividend_tdata
  .m_axis_dout_tvalid(m_axis_dout_tvalid_gr),          // output wire m_axis_dout_tvalid
  .m_axis_dout_tuser(m_axis_dout_tuser_gr),            // output wire [0 : 0] m_axis_dout_tuser
  .m_axis_dout_tdata(m_axis_dout_tdata_gr)            // output wire [47 : 0] m_axis_dout_tdata
);

//gb比例除法器信号
reg s_axis_divisor_tvalid_gb;
wire s_axis_divisor_tready_gb;
wire [32:0] s_axis_divisor_tdata_gb;
reg s_axis_dividend_tvalid_gb;
wire s_axis_dividend_tready_gb;
wire [44:0] s_axis_dividend_tdata_gb;
wire m_axis_dout_tvalid_gb;
wire m_axis_dout_tuser_gb;  
wire [44:0] m_axis_dout_tdata_gb;

assign s_axis_divisor_tdata_gb = {1'b0,live_gw_b};
assign s_axis_dividend_tdata_gb = {1'b0,live_gw_g,12'b0};

always@(posedge pclk) 
    if(!rst_n) s_axis_divisor_tvalid_gb <= 1'b0;  
    else if(frame_end_d4) s_axis_divisor_tvalid_gb <= 1'b1;
    else if(s_axis_divisor_tready_gb) s_axis_divisor_tvalid_gb <= 1'b0;

always@(posedge pclk) 
    if(!rst_n) s_axis_dividend_tvalid_gb <= 1'b0;  
    else if(frame_end_d4) s_axis_dividend_tvalid_gb <= 1'b1;
    else if(s_axis_dividend_tready_gb) s_axis_dividend_tvalid_gb <= 1'b0;  

//实际上是44位除以32位，考虑符号位后，45位除以33位，多出的是拓展位
div_gen_0 div_gen_0_gb (
  .aclk(pclk),                                      // input wire aclk
  .s_axis_divisor_tvalid(s_axis_divisor_tvalid_gb),    // input wire s_axis_divisor_tvalid
  .s_axis_divisor_tready(s_axis_divisor_tready_gb),    // output wire s_axis_divisor_tready
  .s_axis_divisor_tdata(s_axis_divisor_tdata_gb),      // input wire [39 : 0] s_axis_divisor_tdata
  .s_axis_dividend_tvalid(s_axis_dividend_tvalid_gb),  // input wire s_axis_dividend_tvalid
  .s_axis_dividend_tready(s_axis_dividend_tready_gb),  // output wire s_axis_dividend_tready
  .s_axis_dividend_tdata(s_axis_dividend_tdata_gb),    // input wire [47 : 0] s_axis_dividend_tdata
  .m_axis_dout_tvalid(m_axis_dout_tvalid_gb),          // output wire m_axis_dout_tvalid
  .m_axis_dout_tuser(m_axis_dout_tuser_gb),            // output wire [0 : 0] m_axis_dout_tuser
  .m_axis_dout_tdata(m_axis_dout_tdata_gb)            // output wire [47 : 0] m_axis_dout_tdata
);

/*----------------------第二组信号---------------------------*/   
wire [9:0] valid_ratio_pm;                     //10bit表示出千分比的含义
wire [15:0] raw_target_gr_q12,raw_target_gb_q12;
wire [15:0] target_gr_q12,target_gb_q12;
reg [15:0] prev_gr_q12,prev_gb_q12;
wire [43:0] est_gr_q12,est_gb_q12;
wire scene_dominant;
wire scene_change;
wire [3:0] beta_shift;
wire [15:0] iir_gr_q12,iir_gb_q12;
wire [11:0] delta_gr,delta_gb;
wire [15:0] rate_limited_iir_gr_q12,rate_limited_iir_gb_q12;

assign valid_ratio_pm = m_axis_dout_tvalid_vld? (m_axis_dout_tuser_vld ?  10'd0: (m_axis_dout_tdata_vld[41:0] > 10'd1000 ? 10'd1000 : m_axis_dout_tdata_vld[9:0])) : 10'd0; 
assign raw_target_gr_q12 = (s_axis_divisor_tdata_gr == 0 || s_axis_dividend_tdata_gr == 0) ? prev_gr_q12:( m_axis_dout_tvalid_gr ? (m_axis_dout_tdata_gr[43:0] > 16'd65535 ? 16'd65535 : m_axis_dout_tdata_gr[15:0]) : prev_gr_q12);
assign raw_target_gb_q12 = (s_axis_divisor_tdata_gb == 0 || s_axis_dividend_tdata_gb == 0) ? prev_gb_q12:( m_axis_dout_tvalid_gb ? (m_axis_dout_tdata_gb[43:0] > 16'd65535 ? 16'd65535 : m_axis_dout_tdata_gb[15:0]) : prev_gb_q12);
assign target_gr_q12 = clamp_gain_q12(raw_target_gr_q12);
assign target_gb_q12 = clamp_gain_q12(raw_target_gb_q12);

always@(posedge pclk) 
    if(!rst_n) begin
        prev_gr_q12 <= 16'd0;
        prev_gb_q12 <= 16'd0;
    end
    else if(frame_start_d4) begin
        prev_gr_q12 <= target_gr_q12;
        prev_gb_q12 <= target_gb_q12;
    end

assign scene_dominant = (raw_target_gr_q12 > GAIN_TRUST_Q12) && (raw_target_gb_q12 > GAIN_TRUST_Q12) && (valid_ratio_pm < LOW_CONF_RATIO_PM);
assign est_gr_q12 = (next_conf_sog > 0) ? target_gr_q12 : prev_gr_q12;
assign est_gb_q12 = (next_conf_sog > 0) ? target_gb_q12 : prev_gb_q12;
assign scene_change = (abs_diff8(mean_y_cur,prev_mean_y) > 24) || (abs_diff16(est_gr_q12,prev_gr_q12) > (prev_gr_q12 >> 3)) || (abs_diff16(est_gb_q12,prev_gb_q12) > (prev_gb_q12 >> 3));
assign beta_shift = scene_change ? IIR_SHIFT_SCENE_CHANGE : (next_conf_sog == 0) ? IIR_SHIFT_LOW_CONF : IIR_SHIFT_NORMAL;
assign iir_gr_q12 = iir_step_q12(prev_gr_q12,est_gr_q12,beta_shift);
assign iir_gb_q12 = iir_step_q12(prev_gb_q12,est_gb_q12,beta_shift);
assign delta_gr = (prev_gr_q12 >> 4);
assign delta_gb = (prev_gb_q12 >> 4);
assign rate_limited_iir_gr_q12 = ((prev_gr_q12 + delta_gr) > iir_gr_q12) ? ( (prev_gr_q12 - delta_gr) > iir_gr_q12 ? (prev_gr_q12 - delta_gr) : iir_gr_q12 ) : (prev_gr_q12 + delta_gr);
assign rate_limited_iir_gb_q12 = ((prev_gb_q12 + delta_gb) > iir_gb_q12) ? ( (prev_gb_q12 - delta_gb) > iir_gb_q12 ? (prev_gb_q12 - delta_gb) : iir_gb_q12 ) : (prev_gb_q12 + delta_gb);

always@(posedge pclk) 
    if(!rst_n) begin
        pending_gr_q12 <= GAIN_MIN_Q12;
        pending_gb_q12 <= GAIN_MIN_Q12;
        pending_gg_q12 <= 16'h1000;
        pending_conf_sog <= 2'd0;
        pending_conf_edge <= 2'd0;
        pending_hold <= 1'b1;
        pending_scene_change <= 1'b0;
    end
    else if(m_axis_dout_tvalid_gr) begin
        pending_gr_q12 <= clamp_gain_q12(rate_limited_iir_gr_q12);
        pending_gb_q12 <= clamp_gain_q12(rate_limited_iir_gb_q12);
        pending_gg_q12 <= 16'h1000;
        pending_conf_sog <= next_conf_sog;
        pending_conf_edge <= next_conf_edge;
        pending_hold <= hold;
        pending_scene_change <= scene_change;
    end

always@(posedge pclk) 
    if(!rst_n) pending_valid <= 1'b0;
    else pending_valid <= m_axis_dout_tvalid_gr;

//绝对差值计算（8位）
function [7:0] abs_diff8;
    input [7:0] a;
    input [7:0] b;
    begin
        abs_diff8 = (a >= b) ? (a - b) : (b - a);
    end
endfunction    

//绝对差值计算（16位）
function [15:0] abs_diff16;
    input [15:0] a;
    input [15:0] b;
    begin
        abs_diff16 = (a >= b) ? (a - b) : (b - a);
    end
endfunction

//置信度等级
function [1:0] conf_from_ratio;
    input [31:0] count;
    input [23:0] total;
    input [9:0] strong_per_mille;
    input [9:0] med_per_mille;
    input [9:0] weak_per_mille;
    reg [41:0] scaled;
begin
    if (total == 0) begin
        conf_from_ratio = 2'd0;
    end else begin
        scaled = count * 1000;
        if (scaled > (total * strong_per_mille)) begin
            conf_from_ratio = 2'd3;
        end else if (scaled > (total * med_per_mille)) begin
            conf_from_ratio = 2'd2;
        end else if (scaled > (total * weak_per_mille)) begin
            conf_from_ratio = 2'd1;
        end else begin
            conf_from_ratio = 2'd0;
        end
    end
end
endfunction

//一阶IIR滤波器
function [15:0] iir_step_q12;
    input [15:0] prev;
    input [15:0] est;
    input [3:0]  beta_shift;
    reg  [15:0] diff;
    reg  [15:0] step;
begin
        diff = (est >= prev) ? (est - prev) : (prev - est);
        step = (diff >> beta_shift);
        iir_step_q12 = (est >= prev) ? (prev + step): ((prev > step) ? (prev - step) : 16'd0);
end
endfunction

//钳位函数
function [15:0] clamp_gain_q12;
    input [15:0] value;
    begin
        if (value < GAIN_MIN_Q12) begin
            clamp_gain_q12 = GAIN_MIN_Q12;
        end else if (value > GAIN_MAX_Q12) begin
            clamp_gain_q12 = GAIN_MAX_Q12;
        end else begin
            clamp_gain_q12 = value;
        end
    end
endfunction

endmodule