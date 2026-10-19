// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Fri Oct  9 15:54:46 2026
// Host        : LAPTOP-A3O9C30J running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_2_sim_netlist.v
// Design      : blk_mem_gen_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu3eg-sfvc784-1-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_2,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 22944)
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
