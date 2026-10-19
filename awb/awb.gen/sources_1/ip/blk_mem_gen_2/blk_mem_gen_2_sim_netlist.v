// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Fri Oct  9 15:54:47 2026
// Host        : LAPTOP-A3O9C30J running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/zxx12/Desktop/awb/awb/awb.gen/sources_1/ip/blk_mem_gen_2/blk_mem_gen_2_sim_netlist.v
// Design      : blk_mem_gen_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu3eg-sfvc784-1-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_2,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module blk_mem_gen_2
   (clka,
    ena,
    wea,
    addra,
    dina,
    clkb,
    enb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [5:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [8:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [5:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [8:0]doutb;

  wire [5:0]addra;
  wire [5:0]addrb;
  wire clka;
  wire [8:0]dina;
  wire [8:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [8:0]NLW_U0_douta_UNCONNECTED;
  wire [5:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [5:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [8:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "6" *) 
  (* C_ADDRB_WIDTH = "6" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "1" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     0.38675 mW" *) 
  (* C_FAMILY = "zynquplus" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_2.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "64" *) 
  (* C_READ_DEPTH_B = "64" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "9" *) 
  (* C_READ_WIDTH_B = "9" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "64" *) 
  (* C_WRITE_DEPTH_B = "64" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "READ_FIRST" *) 
  (* C_WRITE_WIDTH_A = "9" *) 
  (* C_WRITE_WIDTH_B = "9" *) 
  (* C_XDEVICEFAMILY = "zynquplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_2_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[8:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[5:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[5:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[8:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
sbNGmomEbP78s1hfxgX3P1Jo01EKJk0i0C7iGpF+Yibr9EK0s4mcIifHDN/ag4jpPwW3bPllMHvn
U8AEY3mO8hCXVVoilrcRuCaEna/98GycCzy4G7FnYMfowsJb5k9ifRdE2jnurzeTLFbupUSpDF0H
Rl3Ci3DTGeExAZZ9UQE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zZZZoIprBFYfDWmCCcduELBM7HU98/+rvP9g8+y1mYyD3r3HEDm4ZwehwZvPoYWqoGXYoFqWZh3h
utt0abIfUW9/oF2vJ9hXn7nArtcm/Eui18rPYqp3aj/AItPNVXojk9zp7uFZLPTqcyig5v3Jtenl
qPnLi1Z84ZCW7NIRw6Y0bgmw6z26E8VPbYrZHs+0YW8Sztjo6CdIrQeEL5WBDolA0aHoKHWRZyFs
l5eRDmBAolj2uF07t/3eY3J7cYJmEDaoZ0TR1qcz25VFNu0OlcrEJ19IT+QdAxTah4jqJtknGZrT
6lUMwDZ7dBQwF1EuaE6p90gGNERhGAsbHLdvaw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
KUbz0Iu2faeWqD6HFeuGLtSOAlqZmpKCCJfzym8tkcWUUNgNMn2mYvx6PTM7j4tyig8JdUG3uZYs
NfPgAsNXQtTI7b19u9CkMks9jR+oEzX1rW7QtTvSj/nHZLg2smoFwuB5Ieb7/B8IIs1NTUrIz6Rc
itLQVG+L+GMziamsrx4=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
G7XYdRx9VGclyxTEtwMG+rjJHV8bfBxEGdkcN82UL3koN3Dt0M5AWkzEvHcskt1W0hTOjyYgmvYj
/p70w1nz96tlg226+e4UubpRmBH9QXBBX6UmqIwSiHj9H+XI1yNfTIdlwBKGQvfzwCAMwBwrrrGL
/804k5Ux3RhWRvwezZB4+sj9DFm4akREVXmNpfeqjI2X02LU/MxWMUbKxvjJnD9YxikAAO6ccTd6
8DKv76V76MEFVyXc7E2FeQDToW3lqkRTa6MTpIXbYSekRihQC+qPVuhPUneA4kepvQDfgFYE8/Ir
gu5gK+s/qNfuXhJUAqyLjslrUcY4+XD9ckpSvQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YXkYRXpUPv/tETnwnThdQ46UaPmI23lN9vrxHQjIOhq3WNJCuz7TYZK9hyzSdo6k0U6QE9ihQy2L
rYZg68RGbrK8bzlcnQ41r18LZb4GYlAn9PH7IrF1B+aHm3578doOZHf8wzUE2s+d1aHQIn6VIZjL
14pCTAjErJfMO13fgX6h8sgxb4GFC3eIORmkrq2J/fB9HALyh/qdGiLi7DejMfmdsssbOcPQTZUh
6Belf7fHTkIEr9B44rFZgMyrMVx4N9p0XpXD3JPe7Xeg6a3jxdqxHATaMuLdIa4s+ZiAz1TRx0EO
FFihCnLLb7weBBITQyTIncRL817BrF/ZXZD8Yw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
g7FbNw1ywd4TBNHq8OmK/4zoKI/t7vKmyT8R8SeiyUtKywhn0/7DZ/lV0Lf4IhY8X5MYsKtOQ5l6
DIl3fxtOhxpi8NHn9Nw3Nfb8NnS38Zuy6DSpwOL0f/GSmUSf2/YdB5Ben6xibQT0Oy//oBl5/1kR
pV5fWjj8WRgI6cnmfyj3g1MxepxPu1A/UHxlm1/i9yUHHi114N/hEQ0iujjrn6GxfZSiJUVF+r6c
rnxD//eOAl/YaxhdU/KhUkfsMn+MxtA5m6hTYYE0bnze8rpmEU5UGYKyY0p8KUs+MgsdTe+m/7gV
HSf6puBqQmEa1qksRfl742aL9B9y169or7Jp9Q==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kd1A2zIphLxXB0RyfHIqLkHXfWl0n38vROERuDghYrhK0ItcWGEP0XBrri6k1VZCSPYwiSu//pM6
83BfcPKbk09/A+ksvDIa3xS8Tg7DJK2AS+0pdnzBSjVWh+QD+glA3Hjk6LG9OMbjXyqD3hnMKacA
VRMwxKktV+KT5NXj5a7fMxXjo9exc0xM+woUJiSYs8onoUSwfBeH5/xhUy+iu+w0/OOydQE2LXZ0
1y+RObiz5C22dD4GGCfuvUCGAthYpUf633ZxRYN45mmAn5PxPsH4o+l2GhH/50Gu/VPVoAWDhgXQ
e93oPri++HinkK2uvDhDl4PI9HtRkq11Ky3uXQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
gDrrFgXHVyBo+Cn0bYn+SOSOCXPg7besukY6l0JmA/nu4gap105Wxbg11c7TJZ9ctHVLc5DXAxr+
EIvFpAIepoZBREtMjTlaIdNJ8k1nUpwAv2jaQeseq1TudTjugV1jtOYYk0RKd88z/6SJ8t9urDW0
yKqsfEWU3PwGcUGHOWtTn2hfAceNznmEIFWLmFmzSQJ1hQNdsIQn3jHnfMVYu8cAz5xvPVQWYyJW
pMHXhNYk6GyAjIshh991slb1g01K1ilR2tKD1EmxH5WGrX9BEUqBjHQo6uluC/d3mvcEQ5nJ1v+P
hIlj4qzUQT1wXjpk6d/BvNx7LyWmj5iq35dzNm+cdhfGwaFGG//vgmB6D/dFfs2BYSjHsa6VlpVM
7e2OgoFenuG9p1SVPI6gAs2MuFtnDKfxW7jS3RGhvsquS3tg1iFCDH/OU7E5aWfY7twF3yyN6G10
l72RZw62DfNoCdyUMG9sA8nc4qf6dEhyrr5S6XxpJhoBDJvkeq0TCUQZ

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XR7vRF1m+9DS2Pv4r/O4uHwmvtXkChnKbsJCYczn1dvkZbcZSbBm/2UH78dXUaNorOh9XAuCvSjb
ER73y7e0anAfaIf1tJ9Y9pIb8EuNxGS/Pqdvg36cWarwGac9tsscdv/HWfb5Z+qWEk0/uFcLI7pH
CZO7fF2/ONQjA0NtUFBjW4idlx8WrySIuJgDs4jyGkMhbHR3U/ghF1YhMhwgwsbbcptfC1XLrIqQ
OecZnZu8E2hyc5eK/ccYdKcHnXoL55z1p5amI6Fuvz0wKTz2QQ/mwXodfGjEC1ZRWwTn7zCFM91M
qrA1Is49i6pSa7/VICjgn8ULMT1oKGfJLPm7hg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 22928)
`pragma protect data_block
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
TFvU2+EMdjWBZadrWtk=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
