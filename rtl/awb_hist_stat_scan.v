module awb_hist_stat_scan
#(
    parameter HIST_BINS        = 64,
    parameter BLOCKS_PER_CYCLE = 2
)(
    // 时钟 & 复位
    input                          pclk,
    input                          rst_n,

    // 帧控制信号
    input                          frame_end,

    // 输入数据
    input                            in_valid,
    input   [5:0]                    in_addr0,
    input   [5:0]                    in_addr1,

    // 输出
    output reg  [31:0]                 hist_sum,
    output reg  [5:0]                  hist_bin,
    output reg                         out_valid
);

// ================= 内部信号定义 =================

//对齐读数据打两拍
reg in_valid_d1,in_valid_d2;
reg [5:0] in_addr0_d1, in_addr0_d2 ,in_addr1_d1, in_addr1_d2 ;
reg frame_end_d1,frame_end_d2;

//读接口信号
wire ren;
wire [5:0] raddr0,raddr1;
wire [8:0] doutb0,doutb1;

//写接口信号
wire wea;
reg wea_d1;
wire [5:0] waddr0,waddr1;
reg [5:0] waddr0_d1,waddr1_d1;
wire sel0,sel1;
wire [8:0] r_wdata0,r_wdata1;
reg [8:0] r_wdata0_d1,r_wdata1_d1;
wire [8:0] wdata0,wdata1;

//直方图反扫信号
reg hist_rs_ren;
reg hist_rs_ren_d1,hist_rs_ren_d2;
reg [5:0] hist_rs_raddr;
reg [5:0] hist_rs_raddr_d1,hist_rs_raddr_d2;

//直方图清零信号
reg clc_en;
reg [5:0] clc_addr;

//输入信号打拍对齐ram读数据
always @(posedge pclk) 
    if(!rst_n) begin
        in_valid_d1<= 1'b0;
        in_valid_d2<= 1'b0;
        in_addr0_d1 <= 6'd0;
        in_addr0_d2 <= 6'd0;
        in_addr1_d1 <= 6'd0;
        in_addr1_d2 <= 6'd0;
        frame_end_d1 <= 1'b0;
        frame_end_d2 <= 1'b0;
    end
    else begin
        in_valid_d1 <= in_valid;
        in_valid_d2 <= in_valid_d1;
        in_addr0_d1 <= in_addr0;
        in_addr0_d2 <= in_addr0_d1;
        in_addr1_d1 <= in_addr1;
        in_addr1_d2 <= in_addr1_d1;
        frame_end_d1 <= frame_end;
        frame_end_d2 <= frame_end_d1;
    end

//-----------------写信号---------------------------//
assign ren = in_valid||hist_rs_ren;
assign raddr0 = hist_rs_ren ? hist_rs_raddr : in_addr0;
assign raddr1 = hist_rs_ren ? hist_rs_raddr : in_addr1;

//-----------------读信号---------------------------//
assign wea = in_valid_d2 || clc_en;
assign waddr0 = clc_en ? clc_addr : in_addr0_d2;
assign waddr1 = clc_en ? clc_addr : in_addr1_d2;
wire sel0 = wea_d1 && (waddr0==waddr0_d1);
wire sel1 = wea_d1 && (waddr1==waddr1_d1);
wire r_wdata0 = sel0 ? r_wdata0_d1 + 1'b1 : doutb0 + 1'b1;
wire r_wdata1 = sel1 ? r_wdata1_d1 + 1'b1 : doutb1 + 1'b1;
wire wdata0 = clc_en ? 9'd0 : r_wdata0;
wire wdata1 = clc_en ? 9'd0 : r_wdata1;

always@(posedge pclk) 
    if(!rst_n) begin
        wea_d1 <= 1'b0;
        waddr0_d1 <= 6'd0;
        waddr1_d1 <= 6'd0;
        r_wdata0_d1 <= 9'd0;
        r_wdata1_d1 <= 9'd0;
    end
    else begin
        wea_d1 <= wea;
        waddr0_d1 <= waddr0;
        waddr1_d1 <= waddr1;
        r_wdata0_d1 <= r_wdata0;
        r_wdata1_d1 <= r_wdata1;
    end 

//-----------------直方图反扫信号---------------------------//

always @(posedge pclk) 
    if(!rst_n) hist_rs_ren <= 1'b0;
    else if(frame_end_d2) hist_rs_ren <= 1'b1;

always @(posedge pclk) 
    if(!rst_n) hist_rs_raddr <= 6'd0;
    else if (hist_rs_raddr==6'd63) hist_rs_raddr <= 6'd0;
    else if (hist_rs_ren) hist_rs_raddr <= hist_rs_raddr + 1'b1;    

always @(posedge pclk) 
    if(!rst_n) begin
        hist_rs_ren_d1<=1'b0;
        hist_rs_ren_d2<=1'b0;
        hist_rs_raddr_d1<=6'd0;
        hist_rs_raddr_d2<=6'd0;
    end
    else begin
        hist_rs_ren_d1<=hist_rs_ren;
        hist_rs_ren_d2<=hist_rs_ren_d1;
        hist_rs_raddr_d1<=hist_rs_raddr;
        hist_rs_raddr_d2<=hist_rs_raddr_d1;
    end

//-----------------直方图清零信号---------------------------//
always @(posedge pclk) 
    if(!rst_n) clc_en <= 1'b0;
    else if (clc_addr==6'd63) clc_en <= 1'b0;
    else if (hist_rs_ren) clc_en <= 1'b1;

always @(posedge pclk) 
    if(!rst_n) clc_addr <= 6'd0;
    else if (clc_en) clc_addr <= clc_addr + 1'b1;
    else clc_addr <= 6'd0;

//-----------------输出信号---------------------------//
always @(posedge pclk)
    if(!rst_n) begin
        out_valid<=1'b0;
        hist_bin<=6'b0;
    end
    else begin
        out_valid<=hist_rs_ren_d2;
        hist_bin<=hist_rs_raddr_d2;
    end    

always @(posedge pclk)
    if (!rst_n) hist_sum <= 32'd0;
    else if (frame_end_d2) hist_sum <= 32'd0;     // 扫描起始清 0
    else if (hist_rs_ren_d2) hist_sum <= hist_sum + doutb0 + doutb1;    

//简单双端口，64*9bit，读数据延迟两个周期
blk_mem_gen_2 blk_mem_gen_2_edge0 (
  .clka(pclk),    // input wire clka
  .ena(rst_n),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea
  .addra(waddr0),  // input wire [5 : 0] addra
  .dina(wdata0),    // input wire [8 : 0] dina
  .clkb(pclk),    // input wire clkb
  .enb(!rst_n&ren),      // input wire enb
  .addrb(raddr0),  // input wire [5 : 0] addrb
  .doutb(doutb0)  // output wire [8 : 0] doutb
);

blk_mem_gen_2 blk_mem_gen_2_edge1 (
  .clka(pclk),    // input wire clka
  .ena(rst_n),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea
  .addra(waddr1),  // input wire [5 : 0] addra
  .dina(wdata1),    // input wire [8 : 0] dina
  .clkb(pclk),    // input wire clkb
  .enb(!rst_n&ren),      // input wire enb
  .addrb(raddr1),  // input wire [5 : 0] addrb
  .doutb(doutb1)  // output wire [8 : 0] doutb
);

endmodule