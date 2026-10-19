// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Thu Oct  8 19:32:43 2026
// Host        : LAPTOP-A3O9C30J running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_1_sim_netlist.v
// Design      : blk_mem_gen_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu3eg-sfvc784-1-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_1,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2021.1" *) 
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 33952)
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
