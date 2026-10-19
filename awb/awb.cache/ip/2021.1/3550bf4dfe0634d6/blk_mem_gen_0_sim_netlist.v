// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Tue Oct  6 18:05:47 2026
// Host        : LAPTOP-A3O9C30J running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu3eg-sfvc784-1-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 32768)
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
