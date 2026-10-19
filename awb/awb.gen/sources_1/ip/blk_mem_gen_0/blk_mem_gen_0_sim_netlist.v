// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Tue Oct  6 18:05:48 2026
// Host        : LAPTOP-A3O9C30J running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/zxx12/Desktop/awb/awb/awb.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu3eg-sfvc784-1-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [8:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [47:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [47:0]douta;

  wire [8:0]addra;
  wire clka;
  wire [47:0]dina;
  wire [47:0]douta;
  wire ena;
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
  wire [47:0]NLW_U0_doutb_UNCONNECTED;
  wire [8:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [8:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [47:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "9" *) 
  (* C_ADDRB_WIDTH = "9" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     4.983117 mW" *) 
  (* C_FAMILY = "zynquplus" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
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
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "512" *) 
  (* C_READ_DEPTH_B = "512" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "48" *) 
  (* C_READ_WIDTH_B = "48" *) 
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
  (* C_WRITE_DEPTH_A = "512" *) 
  (* C_WRITE_DEPTH_B = "512" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "48" *) 
  (* C_WRITE_WIDTH_B = "48" *) 
  (* C_XDEVICEFAMILY = "zynquplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[47:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[8:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[8:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[47:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 32752)
`pragma protect data_block
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
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
