// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Thu Oct  8 19:32:43 2026
// Host        : LAPTOP-A3O9C30J running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/zxx12/Desktop/awb/awb/awb.gen/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1_sim_netlist.v
// Design      : blk_mem_gen_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu3eg-sfvc784-1-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_1,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module blk_mem_gen_1
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [8:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [47:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [8:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [47:0]doutb;

  wire [8:0]addra;
  wire [8:0]addrb;
  wire clka;
  wire [47:0]dina;
  wire [47:0]doutb;
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
  wire [47:0]NLW_U0_douta_UNCONNECTED;
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
  (* C_COMMON_CLK = "1" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.745333 mW" *) 
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
  (* C_INIT_FILE = "blk_mem_gen_1.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
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
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "READ_FIRST" *) 
  (* C_WRITE_WIDTH_A = "48" *) 
  (* C_WRITE_WIDTH_B = "48" *) 
  (* C_XDEVICEFAMILY = "zynquplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_1_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[47:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 33920)
`pragma protect data_block
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
xMGaLqQ=
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
