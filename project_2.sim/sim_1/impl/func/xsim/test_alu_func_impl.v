// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed Feb 13 16:45:42 2019
// Host        : ws14-09 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/kjjarvis/project_2/project_2.sim/sim_1/impl/func/xsim/test_alu_func_impl.v
// Design      : register_file
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "20d779d6" *) 
(* NotValidForBitStream *)
module register_file
   (rst,
    clk,
    rd_index1,
    rd_index2,
    rd_data1,
    rd_data2,
    wr_index,
    wr_data,
    wr_enable);
  input rst;
  input clk;
  input [2:0]rd_index1;
  input [2:0]rd_index2;
  output [15:0]rd_data1;
  output [15:0]rd_data2;
  input [2:0]wr_index;
  input [15:0]wr_data;
  input wr_enable;

  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [15:0]rd_data1;
  wire [15:0]rd_data1_OBUF;
  wire \rd_data1_OBUF[0]_inst_i_2_n_0 ;
  wire \rd_data1_OBUF[0]_inst_i_3_n_0 ;
  wire \rd_data1_OBUF[10]_inst_i_2_n_0 ;
  wire \rd_data1_OBUF[10]_inst_i_3_n_0 ;
  wire \rd_data1_OBUF[11]_inst_i_2_n_0 ;
  wire \rd_data1_OBUF[11]_inst_i_3_n_0 ;
  wire \rd_data1_OBUF[12]_inst_i_2_n_0 ;
  wire \rd_data1_OBUF[12]_inst_i_3_n_0 ;
  wire \rd_data1_OBUF[13]_inst_i_2_n_0 ;
  wire \rd_data1_OBUF[13]_inst_i_3_n_0 ;
  wire \rd_data1_OBUF[14]_inst_i_2_n_0 ;
  wire \rd_data1_OBUF[14]_inst_i_3_n_0 ;
  wire \rd_data1_OBUF[15]_inst_i_2_n_0 ;
  wire \rd_data1_OBUF[15]_inst_i_3_n_0 ;
  wire \rd_data1_OBUF[1]_inst_i_2_n_0 ;
  wire \rd_data1_OBUF[1]_inst_i_3_n_0 ;
  wire \rd_data1_OBUF[2]_inst_i_2_n_0 ;
  wire \rd_data1_OBUF[2]_inst_i_3_n_0 ;
  wire \rd_data1_OBUF[3]_inst_i_2_n_0 ;
  wire \rd_data1_OBUF[3]_inst_i_3_n_0 ;
  wire \rd_data1_OBUF[4]_inst_i_2_n_0 ;
  wire \rd_data1_OBUF[4]_inst_i_3_n_0 ;
  wire \rd_data1_OBUF[5]_inst_i_2_n_0 ;
  wire \rd_data1_OBUF[5]_inst_i_3_n_0 ;
  wire \rd_data1_OBUF[6]_inst_i_2_n_0 ;
  wire \rd_data1_OBUF[6]_inst_i_3_n_0 ;
  wire \rd_data1_OBUF[7]_inst_i_2_n_0 ;
  wire \rd_data1_OBUF[7]_inst_i_3_n_0 ;
  wire \rd_data1_OBUF[8]_inst_i_2_n_0 ;
  wire \rd_data1_OBUF[8]_inst_i_3_n_0 ;
  wire \rd_data1_OBUF[9]_inst_i_2_n_0 ;
  wire \rd_data1_OBUF[9]_inst_i_3_n_0 ;
  wire [15:0]rd_data2;
  wire [15:0]rd_data2_OBUF;
  wire \rd_data2_OBUF[0]_inst_i_2_n_0 ;
  wire \rd_data2_OBUF[0]_inst_i_3_n_0 ;
  wire \rd_data2_OBUF[10]_inst_i_2_n_0 ;
  wire \rd_data2_OBUF[10]_inst_i_3_n_0 ;
  wire \rd_data2_OBUF[11]_inst_i_2_n_0 ;
  wire \rd_data2_OBUF[11]_inst_i_3_n_0 ;
  wire \rd_data2_OBUF[12]_inst_i_2_n_0 ;
  wire \rd_data2_OBUF[12]_inst_i_3_n_0 ;
  wire \rd_data2_OBUF[13]_inst_i_2_n_0 ;
  wire \rd_data2_OBUF[13]_inst_i_3_n_0 ;
  wire \rd_data2_OBUF[14]_inst_i_2_n_0 ;
  wire \rd_data2_OBUF[14]_inst_i_3_n_0 ;
  wire \rd_data2_OBUF[15]_inst_i_2_n_0 ;
  wire \rd_data2_OBUF[15]_inst_i_3_n_0 ;
  wire \rd_data2_OBUF[1]_inst_i_2_n_0 ;
  wire \rd_data2_OBUF[1]_inst_i_3_n_0 ;
  wire \rd_data2_OBUF[2]_inst_i_2_n_0 ;
  wire \rd_data2_OBUF[2]_inst_i_3_n_0 ;
  wire \rd_data2_OBUF[3]_inst_i_2_n_0 ;
  wire \rd_data2_OBUF[3]_inst_i_3_n_0 ;
  wire \rd_data2_OBUF[4]_inst_i_2_n_0 ;
  wire \rd_data2_OBUF[4]_inst_i_3_n_0 ;
  wire \rd_data2_OBUF[5]_inst_i_2_n_0 ;
  wire \rd_data2_OBUF[5]_inst_i_3_n_0 ;
  wire \rd_data2_OBUF[6]_inst_i_2_n_0 ;
  wire \rd_data2_OBUF[6]_inst_i_3_n_0 ;
  wire \rd_data2_OBUF[7]_inst_i_2_n_0 ;
  wire \rd_data2_OBUF[7]_inst_i_3_n_0 ;
  wire \rd_data2_OBUF[8]_inst_i_2_n_0 ;
  wire \rd_data2_OBUF[8]_inst_i_3_n_0 ;
  wire \rd_data2_OBUF[9]_inst_i_2_n_0 ;
  wire \rd_data2_OBUF[9]_inst_i_3_n_0 ;
  wire [2:0]rd_index1;
  wire [2:0]rd_index1_IBUF;
  wire [2:0]rd_index2;
  wire [2:0]rd_index2_IBUF;
  wire \reg_file[0] ;
  wire \reg_file[1] ;
  wire \reg_file[2] ;
  wire \reg_file[3] ;
  wire \reg_file[4] ;
  wire \reg_file[5] ;
  wire \reg_file[6] ;
  wire \reg_file[7] ;
  wire \reg_file_reg_n_0_[0][0] ;
  wire \reg_file_reg_n_0_[0][10] ;
  wire \reg_file_reg_n_0_[0][11] ;
  wire \reg_file_reg_n_0_[0][12] ;
  wire \reg_file_reg_n_0_[0][13] ;
  wire \reg_file_reg_n_0_[0][14] ;
  wire \reg_file_reg_n_0_[0][15] ;
  wire \reg_file_reg_n_0_[0][1] ;
  wire \reg_file_reg_n_0_[0][2] ;
  wire \reg_file_reg_n_0_[0][3] ;
  wire \reg_file_reg_n_0_[0][4] ;
  wire \reg_file_reg_n_0_[0][5] ;
  wire \reg_file_reg_n_0_[0][6] ;
  wire \reg_file_reg_n_0_[0][7] ;
  wire \reg_file_reg_n_0_[0][8] ;
  wire \reg_file_reg_n_0_[0][9] ;
  wire \reg_file_reg_n_0_[1][0] ;
  wire \reg_file_reg_n_0_[1][10] ;
  wire \reg_file_reg_n_0_[1][11] ;
  wire \reg_file_reg_n_0_[1][12] ;
  wire \reg_file_reg_n_0_[1][13] ;
  wire \reg_file_reg_n_0_[1][14] ;
  wire \reg_file_reg_n_0_[1][15] ;
  wire \reg_file_reg_n_0_[1][1] ;
  wire \reg_file_reg_n_0_[1][2] ;
  wire \reg_file_reg_n_0_[1][3] ;
  wire \reg_file_reg_n_0_[1][4] ;
  wire \reg_file_reg_n_0_[1][5] ;
  wire \reg_file_reg_n_0_[1][6] ;
  wire \reg_file_reg_n_0_[1][7] ;
  wire \reg_file_reg_n_0_[1][8] ;
  wire \reg_file_reg_n_0_[1][9] ;
  wire \reg_file_reg_n_0_[2][0] ;
  wire \reg_file_reg_n_0_[2][10] ;
  wire \reg_file_reg_n_0_[2][11] ;
  wire \reg_file_reg_n_0_[2][12] ;
  wire \reg_file_reg_n_0_[2][13] ;
  wire \reg_file_reg_n_0_[2][14] ;
  wire \reg_file_reg_n_0_[2][15] ;
  wire \reg_file_reg_n_0_[2][1] ;
  wire \reg_file_reg_n_0_[2][2] ;
  wire \reg_file_reg_n_0_[2][3] ;
  wire \reg_file_reg_n_0_[2][4] ;
  wire \reg_file_reg_n_0_[2][5] ;
  wire \reg_file_reg_n_0_[2][6] ;
  wire \reg_file_reg_n_0_[2][7] ;
  wire \reg_file_reg_n_0_[2][8] ;
  wire \reg_file_reg_n_0_[2][9] ;
  wire \reg_file_reg_n_0_[3][0] ;
  wire \reg_file_reg_n_0_[3][10] ;
  wire \reg_file_reg_n_0_[3][11] ;
  wire \reg_file_reg_n_0_[3][12] ;
  wire \reg_file_reg_n_0_[3][13] ;
  wire \reg_file_reg_n_0_[3][14] ;
  wire \reg_file_reg_n_0_[3][15] ;
  wire \reg_file_reg_n_0_[3][1] ;
  wire \reg_file_reg_n_0_[3][2] ;
  wire \reg_file_reg_n_0_[3][3] ;
  wire \reg_file_reg_n_0_[3][4] ;
  wire \reg_file_reg_n_0_[3][5] ;
  wire \reg_file_reg_n_0_[3][6] ;
  wire \reg_file_reg_n_0_[3][7] ;
  wire \reg_file_reg_n_0_[3][8] ;
  wire \reg_file_reg_n_0_[3][9] ;
  wire \reg_file_reg_n_0_[4][0] ;
  wire \reg_file_reg_n_0_[4][10] ;
  wire \reg_file_reg_n_0_[4][11] ;
  wire \reg_file_reg_n_0_[4][12] ;
  wire \reg_file_reg_n_0_[4][13] ;
  wire \reg_file_reg_n_0_[4][14] ;
  wire \reg_file_reg_n_0_[4][15] ;
  wire \reg_file_reg_n_0_[4][1] ;
  wire \reg_file_reg_n_0_[4][2] ;
  wire \reg_file_reg_n_0_[4][3] ;
  wire \reg_file_reg_n_0_[4][4] ;
  wire \reg_file_reg_n_0_[4][5] ;
  wire \reg_file_reg_n_0_[4][6] ;
  wire \reg_file_reg_n_0_[4][7] ;
  wire \reg_file_reg_n_0_[4][8] ;
  wire \reg_file_reg_n_0_[4][9] ;
  wire \reg_file_reg_n_0_[5][0] ;
  wire \reg_file_reg_n_0_[5][10] ;
  wire \reg_file_reg_n_0_[5][11] ;
  wire \reg_file_reg_n_0_[5][12] ;
  wire \reg_file_reg_n_0_[5][13] ;
  wire \reg_file_reg_n_0_[5][14] ;
  wire \reg_file_reg_n_0_[5][15] ;
  wire \reg_file_reg_n_0_[5][1] ;
  wire \reg_file_reg_n_0_[5][2] ;
  wire \reg_file_reg_n_0_[5][3] ;
  wire \reg_file_reg_n_0_[5][4] ;
  wire \reg_file_reg_n_0_[5][5] ;
  wire \reg_file_reg_n_0_[5][6] ;
  wire \reg_file_reg_n_0_[5][7] ;
  wire \reg_file_reg_n_0_[5][8] ;
  wire \reg_file_reg_n_0_[5][9] ;
  wire \reg_file_reg_n_0_[6][0] ;
  wire \reg_file_reg_n_0_[6][10] ;
  wire \reg_file_reg_n_0_[6][11] ;
  wire \reg_file_reg_n_0_[6][12] ;
  wire \reg_file_reg_n_0_[6][13] ;
  wire \reg_file_reg_n_0_[6][14] ;
  wire \reg_file_reg_n_0_[6][15] ;
  wire \reg_file_reg_n_0_[6][1] ;
  wire \reg_file_reg_n_0_[6][2] ;
  wire \reg_file_reg_n_0_[6][3] ;
  wire \reg_file_reg_n_0_[6][4] ;
  wire \reg_file_reg_n_0_[6][5] ;
  wire \reg_file_reg_n_0_[6][6] ;
  wire \reg_file_reg_n_0_[6][7] ;
  wire \reg_file_reg_n_0_[6][8] ;
  wire \reg_file_reg_n_0_[6][9] ;
  wire \reg_file_reg_n_0_[7][0] ;
  wire \reg_file_reg_n_0_[7][10] ;
  wire \reg_file_reg_n_0_[7][11] ;
  wire \reg_file_reg_n_0_[7][12] ;
  wire \reg_file_reg_n_0_[7][13] ;
  wire \reg_file_reg_n_0_[7][14] ;
  wire \reg_file_reg_n_0_[7][15] ;
  wire \reg_file_reg_n_0_[7][1] ;
  wire \reg_file_reg_n_0_[7][2] ;
  wire \reg_file_reg_n_0_[7][3] ;
  wire \reg_file_reg_n_0_[7][4] ;
  wire \reg_file_reg_n_0_[7][5] ;
  wire \reg_file_reg_n_0_[7][6] ;
  wire \reg_file_reg_n_0_[7][7] ;
  wire \reg_file_reg_n_0_[7][8] ;
  wire \reg_file_reg_n_0_[7][9] ;
  wire rst;
  wire rst_IBUF;
  wire [15:0]wr_data;
  wire [15:0]wr_data_IBUF;
  wire wr_enable;
  wire wr_enable_IBUF;
  wire [2:0]wr_index;
  wire [2:0]wr_index_IBUF;

  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  OBUF \rd_data1_OBUF[0]_inst 
       (.I(rd_data1_OBUF[0]),
        .O(rd_data1[0]));
  MUXF7 \rd_data1_OBUF[0]_inst_i_1 
       (.I0(\rd_data1_OBUF[0]_inst_i_2_n_0 ),
        .I1(\rd_data1_OBUF[0]_inst_i_3_n_0 ),
        .O(rd_data1_OBUF[0]),
        .S(rd_index1_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[0]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][0] ),
        .I1(\reg_file_reg_n_0_[2][0] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][0] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][0] ),
        .O(\rd_data1_OBUF[0]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[0]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][0] ),
        .I1(\reg_file_reg_n_0_[6][0] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][0] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][0] ),
        .O(\rd_data1_OBUF[0]_inst_i_3_n_0 ));
  OBUF \rd_data1_OBUF[10]_inst 
       (.I(rd_data1_OBUF[10]),
        .O(rd_data1[10]));
  MUXF7 \rd_data1_OBUF[10]_inst_i_1 
       (.I0(\rd_data1_OBUF[10]_inst_i_2_n_0 ),
        .I1(\rd_data1_OBUF[10]_inst_i_3_n_0 ),
        .O(rd_data1_OBUF[10]),
        .S(rd_index1_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[10]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][10] ),
        .I1(\reg_file_reg_n_0_[2][10] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][10] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][10] ),
        .O(\rd_data1_OBUF[10]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[10]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][10] ),
        .I1(\reg_file_reg_n_0_[6][10] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][10] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][10] ),
        .O(\rd_data1_OBUF[10]_inst_i_3_n_0 ));
  OBUF \rd_data1_OBUF[11]_inst 
       (.I(rd_data1_OBUF[11]),
        .O(rd_data1[11]));
  MUXF7 \rd_data1_OBUF[11]_inst_i_1 
       (.I0(\rd_data1_OBUF[11]_inst_i_2_n_0 ),
        .I1(\rd_data1_OBUF[11]_inst_i_3_n_0 ),
        .O(rd_data1_OBUF[11]),
        .S(rd_index1_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[11]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][11] ),
        .I1(\reg_file_reg_n_0_[2][11] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][11] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][11] ),
        .O(\rd_data1_OBUF[11]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[11]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][11] ),
        .I1(\reg_file_reg_n_0_[6][11] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][11] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][11] ),
        .O(\rd_data1_OBUF[11]_inst_i_3_n_0 ));
  OBUF \rd_data1_OBUF[12]_inst 
       (.I(rd_data1_OBUF[12]),
        .O(rd_data1[12]));
  MUXF7 \rd_data1_OBUF[12]_inst_i_1 
       (.I0(\rd_data1_OBUF[12]_inst_i_2_n_0 ),
        .I1(\rd_data1_OBUF[12]_inst_i_3_n_0 ),
        .O(rd_data1_OBUF[12]),
        .S(rd_index1_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[12]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][12] ),
        .I1(\reg_file_reg_n_0_[2][12] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][12] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][12] ),
        .O(\rd_data1_OBUF[12]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[12]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][12] ),
        .I1(\reg_file_reg_n_0_[6][12] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][12] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][12] ),
        .O(\rd_data1_OBUF[12]_inst_i_3_n_0 ));
  OBUF \rd_data1_OBUF[13]_inst 
       (.I(rd_data1_OBUF[13]),
        .O(rd_data1[13]));
  MUXF7 \rd_data1_OBUF[13]_inst_i_1 
       (.I0(\rd_data1_OBUF[13]_inst_i_2_n_0 ),
        .I1(\rd_data1_OBUF[13]_inst_i_3_n_0 ),
        .O(rd_data1_OBUF[13]),
        .S(rd_index1_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[13]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][13] ),
        .I1(\reg_file_reg_n_0_[2][13] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][13] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][13] ),
        .O(\rd_data1_OBUF[13]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[13]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][13] ),
        .I1(\reg_file_reg_n_0_[6][13] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][13] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][13] ),
        .O(\rd_data1_OBUF[13]_inst_i_3_n_0 ));
  OBUF \rd_data1_OBUF[14]_inst 
       (.I(rd_data1_OBUF[14]),
        .O(rd_data1[14]));
  MUXF7 \rd_data1_OBUF[14]_inst_i_1 
       (.I0(\rd_data1_OBUF[14]_inst_i_2_n_0 ),
        .I1(\rd_data1_OBUF[14]_inst_i_3_n_0 ),
        .O(rd_data1_OBUF[14]),
        .S(rd_index1_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[14]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][14] ),
        .I1(\reg_file_reg_n_0_[2][14] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][14] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][14] ),
        .O(\rd_data1_OBUF[14]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[14]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][14] ),
        .I1(\reg_file_reg_n_0_[6][14] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][14] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][14] ),
        .O(\rd_data1_OBUF[14]_inst_i_3_n_0 ));
  OBUF \rd_data1_OBUF[15]_inst 
       (.I(rd_data1_OBUF[15]),
        .O(rd_data1[15]));
  MUXF7 \rd_data1_OBUF[15]_inst_i_1 
       (.I0(\rd_data1_OBUF[15]_inst_i_2_n_0 ),
        .I1(\rd_data1_OBUF[15]_inst_i_3_n_0 ),
        .O(rd_data1_OBUF[15]),
        .S(rd_index1_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[15]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][15] ),
        .I1(\reg_file_reg_n_0_[2][15] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][15] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][15] ),
        .O(\rd_data1_OBUF[15]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[15]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][15] ),
        .I1(\reg_file_reg_n_0_[6][15] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][15] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][15] ),
        .O(\rd_data1_OBUF[15]_inst_i_3_n_0 ));
  OBUF \rd_data1_OBUF[1]_inst 
       (.I(rd_data1_OBUF[1]),
        .O(rd_data1[1]));
  MUXF7 \rd_data1_OBUF[1]_inst_i_1 
       (.I0(\rd_data1_OBUF[1]_inst_i_2_n_0 ),
        .I1(\rd_data1_OBUF[1]_inst_i_3_n_0 ),
        .O(rd_data1_OBUF[1]),
        .S(rd_index1_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[1]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][1] ),
        .I1(\reg_file_reg_n_0_[2][1] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][1] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][1] ),
        .O(\rd_data1_OBUF[1]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[1]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][1] ),
        .I1(\reg_file_reg_n_0_[6][1] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][1] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][1] ),
        .O(\rd_data1_OBUF[1]_inst_i_3_n_0 ));
  OBUF \rd_data1_OBUF[2]_inst 
       (.I(rd_data1_OBUF[2]),
        .O(rd_data1[2]));
  MUXF7 \rd_data1_OBUF[2]_inst_i_1 
       (.I0(\rd_data1_OBUF[2]_inst_i_2_n_0 ),
        .I1(\rd_data1_OBUF[2]_inst_i_3_n_0 ),
        .O(rd_data1_OBUF[2]),
        .S(rd_index1_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[2]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][2] ),
        .I1(\reg_file_reg_n_0_[2][2] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][2] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][2] ),
        .O(\rd_data1_OBUF[2]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[2]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][2] ),
        .I1(\reg_file_reg_n_0_[6][2] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][2] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][2] ),
        .O(\rd_data1_OBUF[2]_inst_i_3_n_0 ));
  OBUF \rd_data1_OBUF[3]_inst 
       (.I(rd_data1_OBUF[3]),
        .O(rd_data1[3]));
  MUXF7 \rd_data1_OBUF[3]_inst_i_1 
       (.I0(\rd_data1_OBUF[3]_inst_i_2_n_0 ),
        .I1(\rd_data1_OBUF[3]_inst_i_3_n_0 ),
        .O(rd_data1_OBUF[3]),
        .S(rd_index1_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[3]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][3] ),
        .I1(\reg_file_reg_n_0_[2][3] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][3] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][3] ),
        .O(\rd_data1_OBUF[3]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[3]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][3] ),
        .I1(\reg_file_reg_n_0_[6][3] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][3] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][3] ),
        .O(\rd_data1_OBUF[3]_inst_i_3_n_0 ));
  OBUF \rd_data1_OBUF[4]_inst 
       (.I(rd_data1_OBUF[4]),
        .O(rd_data1[4]));
  MUXF7 \rd_data1_OBUF[4]_inst_i_1 
       (.I0(\rd_data1_OBUF[4]_inst_i_2_n_0 ),
        .I1(\rd_data1_OBUF[4]_inst_i_3_n_0 ),
        .O(rd_data1_OBUF[4]),
        .S(rd_index1_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[4]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][4] ),
        .I1(\reg_file_reg_n_0_[2][4] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][4] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][4] ),
        .O(\rd_data1_OBUF[4]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[4]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][4] ),
        .I1(\reg_file_reg_n_0_[6][4] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][4] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][4] ),
        .O(\rd_data1_OBUF[4]_inst_i_3_n_0 ));
  OBUF \rd_data1_OBUF[5]_inst 
       (.I(rd_data1_OBUF[5]),
        .O(rd_data1[5]));
  MUXF7 \rd_data1_OBUF[5]_inst_i_1 
       (.I0(\rd_data1_OBUF[5]_inst_i_2_n_0 ),
        .I1(\rd_data1_OBUF[5]_inst_i_3_n_0 ),
        .O(rd_data1_OBUF[5]),
        .S(rd_index1_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[5]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][5] ),
        .I1(\reg_file_reg_n_0_[2][5] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][5] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][5] ),
        .O(\rd_data1_OBUF[5]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[5]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][5] ),
        .I1(\reg_file_reg_n_0_[6][5] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][5] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][5] ),
        .O(\rd_data1_OBUF[5]_inst_i_3_n_0 ));
  OBUF \rd_data1_OBUF[6]_inst 
       (.I(rd_data1_OBUF[6]),
        .O(rd_data1[6]));
  MUXF7 \rd_data1_OBUF[6]_inst_i_1 
       (.I0(\rd_data1_OBUF[6]_inst_i_2_n_0 ),
        .I1(\rd_data1_OBUF[6]_inst_i_3_n_0 ),
        .O(rd_data1_OBUF[6]),
        .S(rd_index1_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[6]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][6] ),
        .I1(\reg_file_reg_n_0_[2][6] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][6] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][6] ),
        .O(\rd_data1_OBUF[6]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[6]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][6] ),
        .I1(\reg_file_reg_n_0_[6][6] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][6] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][6] ),
        .O(\rd_data1_OBUF[6]_inst_i_3_n_0 ));
  OBUF \rd_data1_OBUF[7]_inst 
       (.I(rd_data1_OBUF[7]),
        .O(rd_data1[7]));
  MUXF7 \rd_data1_OBUF[7]_inst_i_1 
       (.I0(\rd_data1_OBUF[7]_inst_i_2_n_0 ),
        .I1(\rd_data1_OBUF[7]_inst_i_3_n_0 ),
        .O(rd_data1_OBUF[7]),
        .S(rd_index1_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[7]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][7] ),
        .I1(\reg_file_reg_n_0_[2][7] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][7] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][7] ),
        .O(\rd_data1_OBUF[7]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[7]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][7] ),
        .I1(\reg_file_reg_n_0_[6][7] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][7] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][7] ),
        .O(\rd_data1_OBUF[7]_inst_i_3_n_0 ));
  OBUF \rd_data1_OBUF[8]_inst 
       (.I(rd_data1_OBUF[8]),
        .O(rd_data1[8]));
  MUXF7 \rd_data1_OBUF[8]_inst_i_1 
       (.I0(\rd_data1_OBUF[8]_inst_i_2_n_0 ),
        .I1(\rd_data1_OBUF[8]_inst_i_3_n_0 ),
        .O(rd_data1_OBUF[8]),
        .S(rd_index1_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[8]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][8] ),
        .I1(\reg_file_reg_n_0_[2][8] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][8] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][8] ),
        .O(\rd_data1_OBUF[8]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[8]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][8] ),
        .I1(\reg_file_reg_n_0_[6][8] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][8] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][8] ),
        .O(\rd_data1_OBUF[8]_inst_i_3_n_0 ));
  OBUF \rd_data1_OBUF[9]_inst 
       (.I(rd_data1_OBUF[9]),
        .O(rd_data1[9]));
  MUXF7 \rd_data1_OBUF[9]_inst_i_1 
       (.I0(\rd_data1_OBUF[9]_inst_i_2_n_0 ),
        .I1(\rd_data1_OBUF[9]_inst_i_3_n_0 ),
        .O(rd_data1_OBUF[9]),
        .S(rd_index1_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[9]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][9] ),
        .I1(\reg_file_reg_n_0_[2][9] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][9] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][9] ),
        .O(\rd_data1_OBUF[9]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data1_OBUF[9]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][9] ),
        .I1(\reg_file_reg_n_0_[6][9] ),
        .I2(rd_index1_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][9] ),
        .I4(rd_index1_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][9] ),
        .O(\rd_data1_OBUF[9]_inst_i_3_n_0 ));
  OBUF \rd_data2_OBUF[0]_inst 
       (.I(rd_data2_OBUF[0]),
        .O(rd_data2[0]));
  MUXF7 \rd_data2_OBUF[0]_inst_i_1 
       (.I0(\rd_data2_OBUF[0]_inst_i_2_n_0 ),
        .I1(\rd_data2_OBUF[0]_inst_i_3_n_0 ),
        .O(rd_data2_OBUF[0]),
        .S(rd_index2_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[0]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][0] ),
        .I1(\reg_file_reg_n_0_[2][0] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][0] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][0] ),
        .O(\rd_data2_OBUF[0]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[0]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][0] ),
        .I1(\reg_file_reg_n_0_[6][0] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][0] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][0] ),
        .O(\rd_data2_OBUF[0]_inst_i_3_n_0 ));
  OBUF \rd_data2_OBUF[10]_inst 
       (.I(rd_data2_OBUF[10]),
        .O(rd_data2[10]));
  MUXF7 \rd_data2_OBUF[10]_inst_i_1 
       (.I0(\rd_data2_OBUF[10]_inst_i_2_n_0 ),
        .I1(\rd_data2_OBUF[10]_inst_i_3_n_0 ),
        .O(rd_data2_OBUF[10]),
        .S(rd_index2_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[10]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][10] ),
        .I1(\reg_file_reg_n_0_[2][10] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][10] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][10] ),
        .O(\rd_data2_OBUF[10]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[10]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][10] ),
        .I1(\reg_file_reg_n_0_[6][10] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][10] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][10] ),
        .O(\rd_data2_OBUF[10]_inst_i_3_n_0 ));
  OBUF \rd_data2_OBUF[11]_inst 
       (.I(rd_data2_OBUF[11]),
        .O(rd_data2[11]));
  MUXF7 \rd_data2_OBUF[11]_inst_i_1 
       (.I0(\rd_data2_OBUF[11]_inst_i_2_n_0 ),
        .I1(\rd_data2_OBUF[11]_inst_i_3_n_0 ),
        .O(rd_data2_OBUF[11]),
        .S(rd_index2_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[11]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][11] ),
        .I1(\reg_file_reg_n_0_[2][11] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][11] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][11] ),
        .O(\rd_data2_OBUF[11]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[11]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][11] ),
        .I1(\reg_file_reg_n_0_[6][11] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][11] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][11] ),
        .O(\rd_data2_OBUF[11]_inst_i_3_n_0 ));
  OBUF \rd_data2_OBUF[12]_inst 
       (.I(rd_data2_OBUF[12]),
        .O(rd_data2[12]));
  MUXF7 \rd_data2_OBUF[12]_inst_i_1 
       (.I0(\rd_data2_OBUF[12]_inst_i_2_n_0 ),
        .I1(\rd_data2_OBUF[12]_inst_i_3_n_0 ),
        .O(rd_data2_OBUF[12]),
        .S(rd_index2_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[12]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][12] ),
        .I1(\reg_file_reg_n_0_[2][12] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][12] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][12] ),
        .O(\rd_data2_OBUF[12]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[12]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][12] ),
        .I1(\reg_file_reg_n_0_[6][12] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][12] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][12] ),
        .O(\rd_data2_OBUF[12]_inst_i_3_n_0 ));
  OBUF \rd_data2_OBUF[13]_inst 
       (.I(rd_data2_OBUF[13]),
        .O(rd_data2[13]));
  MUXF7 \rd_data2_OBUF[13]_inst_i_1 
       (.I0(\rd_data2_OBUF[13]_inst_i_2_n_0 ),
        .I1(\rd_data2_OBUF[13]_inst_i_3_n_0 ),
        .O(rd_data2_OBUF[13]),
        .S(rd_index2_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[13]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][13] ),
        .I1(\reg_file_reg_n_0_[2][13] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][13] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][13] ),
        .O(\rd_data2_OBUF[13]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[13]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][13] ),
        .I1(\reg_file_reg_n_0_[6][13] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][13] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][13] ),
        .O(\rd_data2_OBUF[13]_inst_i_3_n_0 ));
  OBUF \rd_data2_OBUF[14]_inst 
       (.I(rd_data2_OBUF[14]),
        .O(rd_data2[14]));
  MUXF7 \rd_data2_OBUF[14]_inst_i_1 
       (.I0(\rd_data2_OBUF[14]_inst_i_2_n_0 ),
        .I1(\rd_data2_OBUF[14]_inst_i_3_n_0 ),
        .O(rd_data2_OBUF[14]),
        .S(rd_index2_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[14]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][14] ),
        .I1(\reg_file_reg_n_0_[2][14] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][14] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][14] ),
        .O(\rd_data2_OBUF[14]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[14]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][14] ),
        .I1(\reg_file_reg_n_0_[6][14] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][14] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][14] ),
        .O(\rd_data2_OBUF[14]_inst_i_3_n_0 ));
  OBUF \rd_data2_OBUF[15]_inst 
       (.I(rd_data2_OBUF[15]),
        .O(rd_data2[15]));
  MUXF7 \rd_data2_OBUF[15]_inst_i_1 
       (.I0(\rd_data2_OBUF[15]_inst_i_2_n_0 ),
        .I1(\rd_data2_OBUF[15]_inst_i_3_n_0 ),
        .O(rd_data2_OBUF[15]),
        .S(rd_index2_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[15]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][15] ),
        .I1(\reg_file_reg_n_0_[2][15] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][15] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][15] ),
        .O(\rd_data2_OBUF[15]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[15]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][15] ),
        .I1(\reg_file_reg_n_0_[6][15] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][15] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][15] ),
        .O(\rd_data2_OBUF[15]_inst_i_3_n_0 ));
  OBUF \rd_data2_OBUF[1]_inst 
       (.I(rd_data2_OBUF[1]),
        .O(rd_data2[1]));
  MUXF7 \rd_data2_OBUF[1]_inst_i_1 
       (.I0(\rd_data2_OBUF[1]_inst_i_2_n_0 ),
        .I1(\rd_data2_OBUF[1]_inst_i_3_n_0 ),
        .O(rd_data2_OBUF[1]),
        .S(rd_index2_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[1]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][1] ),
        .I1(\reg_file_reg_n_0_[2][1] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][1] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][1] ),
        .O(\rd_data2_OBUF[1]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[1]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][1] ),
        .I1(\reg_file_reg_n_0_[6][1] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][1] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][1] ),
        .O(\rd_data2_OBUF[1]_inst_i_3_n_0 ));
  OBUF \rd_data2_OBUF[2]_inst 
       (.I(rd_data2_OBUF[2]),
        .O(rd_data2[2]));
  MUXF7 \rd_data2_OBUF[2]_inst_i_1 
       (.I0(\rd_data2_OBUF[2]_inst_i_2_n_0 ),
        .I1(\rd_data2_OBUF[2]_inst_i_3_n_0 ),
        .O(rd_data2_OBUF[2]),
        .S(rd_index2_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[2]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][2] ),
        .I1(\reg_file_reg_n_0_[2][2] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][2] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][2] ),
        .O(\rd_data2_OBUF[2]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[2]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][2] ),
        .I1(\reg_file_reg_n_0_[6][2] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][2] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][2] ),
        .O(\rd_data2_OBUF[2]_inst_i_3_n_0 ));
  OBUF \rd_data2_OBUF[3]_inst 
       (.I(rd_data2_OBUF[3]),
        .O(rd_data2[3]));
  MUXF7 \rd_data2_OBUF[3]_inst_i_1 
       (.I0(\rd_data2_OBUF[3]_inst_i_2_n_0 ),
        .I1(\rd_data2_OBUF[3]_inst_i_3_n_0 ),
        .O(rd_data2_OBUF[3]),
        .S(rd_index2_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[3]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][3] ),
        .I1(\reg_file_reg_n_0_[2][3] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][3] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][3] ),
        .O(\rd_data2_OBUF[3]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[3]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][3] ),
        .I1(\reg_file_reg_n_0_[6][3] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][3] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][3] ),
        .O(\rd_data2_OBUF[3]_inst_i_3_n_0 ));
  OBUF \rd_data2_OBUF[4]_inst 
       (.I(rd_data2_OBUF[4]),
        .O(rd_data2[4]));
  MUXF7 \rd_data2_OBUF[4]_inst_i_1 
       (.I0(\rd_data2_OBUF[4]_inst_i_2_n_0 ),
        .I1(\rd_data2_OBUF[4]_inst_i_3_n_0 ),
        .O(rd_data2_OBUF[4]),
        .S(rd_index2_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[4]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][4] ),
        .I1(\reg_file_reg_n_0_[2][4] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][4] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][4] ),
        .O(\rd_data2_OBUF[4]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[4]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][4] ),
        .I1(\reg_file_reg_n_0_[6][4] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][4] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][4] ),
        .O(\rd_data2_OBUF[4]_inst_i_3_n_0 ));
  OBUF \rd_data2_OBUF[5]_inst 
       (.I(rd_data2_OBUF[5]),
        .O(rd_data2[5]));
  MUXF7 \rd_data2_OBUF[5]_inst_i_1 
       (.I0(\rd_data2_OBUF[5]_inst_i_2_n_0 ),
        .I1(\rd_data2_OBUF[5]_inst_i_3_n_0 ),
        .O(rd_data2_OBUF[5]),
        .S(rd_index2_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[5]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][5] ),
        .I1(\reg_file_reg_n_0_[2][5] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][5] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][5] ),
        .O(\rd_data2_OBUF[5]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[5]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][5] ),
        .I1(\reg_file_reg_n_0_[6][5] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][5] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][5] ),
        .O(\rd_data2_OBUF[5]_inst_i_3_n_0 ));
  OBUF \rd_data2_OBUF[6]_inst 
       (.I(rd_data2_OBUF[6]),
        .O(rd_data2[6]));
  MUXF7 \rd_data2_OBUF[6]_inst_i_1 
       (.I0(\rd_data2_OBUF[6]_inst_i_2_n_0 ),
        .I1(\rd_data2_OBUF[6]_inst_i_3_n_0 ),
        .O(rd_data2_OBUF[6]),
        .S(rd_index2_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[6]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][6] ),
        .I1(\reg_file_reg_n_0_[2][6] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][6] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][6] ),
        .O(\rd_data2_OBUF[6]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[6]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][6] ),
        .I1(\reg_file_reg_n_0_[6][6] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][6] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][6] ),
        .O(\rd_data2_OBUF[6]_inst_i_3_n_0 ));
  OBUF \rd_data2_OBUF[7]_inst 
       (.I(rd_data2_OBUF[7]),
        .O(rd_data2[7]));
  MUXF7 \rd_data2_OBUF[7]_inst_i_1 
       (.I0(\rd_data2_OBUF[7]_inst_i_2_n_0 ),
        .I1(\rd_data2_OBUF[7]_inst_i_3_n_0 ),
        .O(rd_data2_OBUF[7]),
        .S(rd_index2_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[7]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][7] ),
        .I1(\reg_file_reg_n_0_[2][7] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][7] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][7] ),
        .O(\rd_data2_OBUF[7]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[7]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][7] ),
        .I1(\reg_file_reg_n_0_[6][7] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][7] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][7] ),
        .O(\rd_data2_OBUF[7]_inst_i_3_n_0 ));
  OBUF \rd_data2_OBUF[8]_inst 
       (.I(rd_data2_OBUF[8]),
        .O(rd_data2[8]));
  MUXF7 \rd_data2_OBUF[8]_inst_i_1 
       (.I0(\rd_data2_OBUF[8]_inst_i_2_n_0 ),
        .I1(\rd_data2_OBUF[8]_inst_i_3_n_0 ),
        .O(rd_data2_OBUF[8]),
        .S(rd_index2_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[8]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][8] ),
        .I1(\reg_file_reg_n_0_[2][8] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][8] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][8] ),
        .O(\rd_data2_OBUF[8]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[8]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][8] ),
        .I1(\reg_file_reg_n_0_[6][8] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][8] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][8] ),
        .O(\rd_data2_OBUF[8]_inst_i_3_n_0 ));
  OBUF \rd_data2_OBUF[9]_inst 
       (.I(rd_data2_OBUF[9]),
        .O(rd_data2[9]));
  MUXF7 \rd_data2_OBUF[9]_inst_i_1 
       (.I0(\rd_data2_OBUF[9]_inst_i_2_n_0 ),
        .I1(\rd_data2_OBUF[9]_inst_i_3_n_0 ),
        .O(rd_data2_OBUF[9]),
        .S(rd_index2_IBUF[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[9]_inst_i_2 
       (.I0(\reg_file_reg_n_0_[3][9] ),
        .I1(\reg_file_reg_n_0_[2][9] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[1][9] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[0][9] ),
        .O(\rd_data2_OBUF[9]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rd_data2_OBUF[9]_inst_i_3 
       (.I0(\reg_file_reg_n_0_[7][9] ),
        .I1(\reg_file_reg_n_0_[6][9] ),
        .I2(rd_index2_IBUF[1]),
        .I3(\reg_file_reg_n_0_[5][9] ),
        .I4(rd_index2_IBUF[0]),
        .I5(\reg_file_reg_n_0_[4][9] ),
        .O(\rd_data2_OBUF[9]_inst_i_3_n_0 ));
  IBUF \rd_index1_IBUF[0]_inst 
       (.I(rd_index1[0]),
        .O(rd_index1_IBUF[0]));
  IBUF \rd_index1_IBUF[1]_inst 
       (.I(rd_index1[1]),
        .O(rd_index1_IBUF[1]));
  IBUF \rd_index1_IBUF[2]_inst 
       (.I(rd_index1[2]),
        .O(rd_index1_IBUF[2]));
  IBUF \rd_index2_IBUF[0]_inst 
       (.I(rd_index2[0]),
        .O(rd_index2_IBUF[0]));
  IBUF \rd_index2_IBUF[1]_inst 
       (.I(rd_index2[1]),
        .O(rd_index2_IBUF[1]));
  IBUF \rd_index2_IBUF[2]_inst 
       (.I(rd_index2[2]),
        .O(rd_index2_IBUF[2]));
  LUT4 #(
    .INIT(16'h0100)) 
    \reg_file[0][15]_i_1 
       (.I0(wr_index_IBUF[1]),
        .I1(wr_index_IBUF[0]),
        .I2(wr_index_IBUF[2]),
        .I3(wr_enable_IBUF),
        .O(\reg_file[0] ));
  LUT4 #(
    .INIT(16'h0400)) 
    \reg_file[1][15]_i_1 
       (.I0(wr_index_IBUF[1]),
        .I1(wr_index_IBUF[0]),
        .I2(wr_index_IBUF[2]),
        .I3(wr_enable_IBUF),
        .O(\reg_file[1] ));
  LUT4 #(
    .INIT(16'h0400)) 
    \reg_file[2][15]_i_1 
       (.I0(wr_index_IBUF[2]),
        .I1(wr_index_IBUF[1]),
        .I2(wr_index_IBUF[0]),
        .I3(wr_enable_IBUF),
        .O(\reg_file[2] ));
  LUT4 #(
    .INIT(16'h4000)) 
    \reg_file[3][15]_i_1 
       (.I0(wr_index_IBUF[2]),
        .I1(wr_index_IBUF[0]),
        .I2(wr_index_IBUF[1]),
        .I3(wr_enable_IBUF),
        .O(\reg_file[3] ));
  LUT4 #(
    .INIT(16'h0400)) 
    \reg_file[4][15]_i_1 
       (.I0(wr_index_IBUF[1]),
        .I1(wr_index_IBUF[2]),
        .I2(wr_index_IBUF[0]),
        .I3(wr_enable_IBUF),
        .O(\reg_file[4] ));
  LUT4 #(
    .INIT(16'h4000)) 
    \reg_file[5][15]_i_1 
       (.I0(wr_index_IBUF[1]),
        .I1(wr_index_IBUF[0]),
        .I2(wr_index_IBUF[2]),
        .I3(wr_enable_IBUF),
        .O(\reg_file[5] ));
  LUT4 #(
    .INIT(16'h4000)) 
    \reg_file[6][15]_i_1 
       (.I0(wr_index_IBUF[0]),
        .I1(wr_index_IBUF[2]),
        .I2(wr_index_IBUF[1]),
        .I3(wr_enable_IBUF),
        .O(\reg_file[6] ));
  LUT4 #(
    .INIT(16'h8000)) 
    \reg_file[7][15]_i_1 
       (.I0(wr_index_IBUF[0]),
        .I1(wr_index_IBUF[2]),
        .I2(wr_index_IBUF[1]),
        .I3(wr_enable_IBUF),
        .O(\reg_file[7] ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[0][0] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[0] ),
        .D(wr_data_IBUF[0]),
        .Q(\reg_file_reg_n_0_[0][0] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[0][10] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[0] ),
        .D(wr_data_IBUF[10]),
        .Q(\reg_file_reg_n_0_[0][10] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[0][11] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[0] ),
        .D(wr_data_IBUF[11]),
        .Q(\reg_file_reg_n_0_[0][11] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[0][12] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[0] ),
        .D(wr_data_IBUF[12]),
        .Q(\reg_file_reg_n_0_[0][12] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[0][13] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[0] ),
        .D(wr_data_IBUF[13]),
        .Q(\reg_file_reg_n_0_[0][13] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[0][14] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[0] ),
        .D(wr_data_IBUF[14]),
        .Q(\reg_file_reg_n_0_[0][14] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[0][15] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[0] ),
        .D(wr_data_IBUF[15]),
        .Q(\reg_file_reg_n_0_[0][15] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[0][1] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[0] ),
        .D(wr_data_IBUF[1]),
        .Q(\reg_file_reg_n_0_[0][1] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[0][2] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[0] ),
        .D(wr_data_IBUF[2]),
        .Q(\reg_file_reg_n_0_[0][2] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[0][3] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[0] ),
        .D(wr_data_IBUF[3]),
        .Q(\reg_file_reg_n_0_[0][3] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[0][4] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[0] ),
        .D(wr_data_IBUF[4]),
        .Q(\reg_file_reg_n_0_[0][4] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[0][5] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[0] ),
        .D(wr_data_IBUF[5]),
        .Q(\reg_file_reg_n_0_[0][5] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[0][6] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[0] ),
        .D(wr_data_IBUF[6]),
        .Q(\reg_file_reg_n_0_[0][6] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[0][7] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[0] ),
        .D(wr_data_IBUF[7]),
        .Q(\reg_file_reg_n_0_[0][7] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[0][8] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[0] ),
        .D(wr_data_IBUF[8]),
        .Q(\reg_file_reg_n_0_[0][8] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[0][9] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[0] ),
        .D(wr_data_IBUF[9]),
        .Q(\reg_file_reg_n_0_[0][9] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[1][0] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[1] ),
        .D(wr_data_IBUF[0]),
        .Q(\reg_file_reg_n_0_[1][0] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[1][10] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[1] ),
        .D(wr_data_IBUF[10]),
        .Q(\reg_file_reg_n_0_[1][10] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[1][11] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[1] ),
        .D(wr_data_IBUF[11]),
        .Q(\reg_file_reg_n_0_[1][11] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[1][12] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[1] ),
        .D(wr_data_IBUF[12]),
        .Q(\reg_file_reg_n_0_[1][12] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[1][13] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[1] ),
        .D(wr_data_IBUF[13]),
        .Q(\reg_file_reg_n_0_[1][13] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[1][14] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[1] ),
        .D(wr_data_IBUF[14]),
        .Q(\reg_file_reg_n_0_[1][14] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[1][15] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[1] ),
        .D(wr_data_IBUF[15]),
        .Q(\reg_file_reg_n_0_[1][15] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[1][1] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[1] ),
        .D(wr_data_IBUF[1]),
        .Q(\reg_file_reg_n_0_[1][1] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[1][2] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[1] ),
        .D(wr_data_IBUF[2]),
        .Q(\reg_file_reg_n_0_[1][2] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[1][3] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[1] ),
        .D(wr_data_IBUF[3]),
        .Q(\reg_file_reg_n_0_[1][3] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[1][4] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[1] ),
        .D(wr_data_IBUF[4]),
        .Q(\reg_file_reg_n_0_[1][4] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[1][5] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[1] ),
        .D(wr_data_IBUF[5]),
        .Q(\reg_file_reg_n_0_[1][5] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[1][6] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[1] ),
        .D(wr_data_IBUF[6]),
        .Q(\reg_file_reg_n_0_[1][6] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[1][7] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[1] ),
        .D(wr_data_IBUF[7]),
        .Q(\reg_file_reg_n_0_[1][7] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[1][8] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[1] ),
        .D(wr_data_IBUF[8]),
        .Q(\reg_file_reg_n_0_[1][8] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[1][9] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[1] ),
        .D(wr_data_IBUF[9]),
        .Q(\reg_file_reg_n_0_[1][9] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[2][0] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[2] ),
        .D(wr_data_IBUF[0]),
        .Q(\reg_file_reg_n_0_[2][0] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[2][10] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[2] ),
        .D(wr_data_IBUF[10]),
        .Q(\reg_file_reg_n_0_[2][10] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[2][11] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[2] ),
        .D(wr_data_IBUF[11]),
        .Q(\reg_file_reg_n_0_[2][11] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[2][12] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[2] ),
        .D(wr_data_IBUF[12]),
        .Q(\reg_file_reg_n_0_[2][12] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[2][13] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[2] ),
        .D(wr_data_IBUF[13]),
        .Q(\reg_file_reg_n_0_[2][13] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[2][14] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[2] ),
        .D(wr_data_IBUF[14]),
        .Q(\reg_file_reg_n_0_[2][14] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[2][15] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[2] ),
        .D(wr_data_IBUF[15]),
        .Q(\reg_file_reg_n_0_[2][15] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[2][1] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[2] ),
        .D(wr_data_IBUF[1]),
        .Q(\reg_file_reg_n_0_[2][1] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[2][2] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[2] ),
        .D(wr_data_IBUF[2]),
        .Q(\reg_file_reg_n_0_[2][2] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[2][3] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[2] ),
        .D(wr_data_IBUF[3]),
        .Q(\reg_file_reg_n_0_[2][3] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[2][4] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[2] ),
        .D(wr_data_IBUF[4]),
        .Q(\reg_file_reg_n_0_[2][4] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[2][5] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[2] ),
        .D(wr_data_IBUF[5]),
        .Q(\reg_file_reg_n_0_[2][5] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[2][6] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[2] ),
        .D(wr_data_IBUF[6]),
        .Q(\reg_file_reg_n_0_[2][6] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[2][7] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[2] ),
        .D(wr_data_IBUF[7]),
        .Q(\reg_file_reg_n_0_[2][7] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[2][8] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[2] ),
        .D(wr_data_IBUF[8]),
        .Q(\reg_file_reg_n_0_[2][8] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[2][9] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[2] ),
        .D(wr_data_IBUF[9]),
        .Q(\reg_file_reg_n_0_[2][9] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[3][0] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[3] ),
        .D(wr_data_IBUF[0]),
        .Q(\reg_file_reg_n_0_[3][0] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[3][10] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[3] ),
        .D(wr_data_IBUF[10]),
        .Q(\reg_file_reg_n_0_[3][10] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[3][11] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[3] ),
        .D(wr_data_IBUF[11]),
        .Q(\reg_file_reg_n_0_[3][11] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[3][12] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[3] ),
        .D(wr_data_IBUF[12]),
        .Q(\reg_file_reg_n_0_[3][12] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[3][13] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[3] ),
        .D(wr_data_IBUF[13]),
        .Q(\reg_file_reg_n_0_[3][13] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[3][14] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[3] ),
        .D(wr_data_IBUF[14]),
        .Q(\reg_file_reg_n_0_[3][14] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[3][15] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[3] ),
        .D(wr_data_IBUF[15]),
        .Q(\reg_file_reg_n_0_[3][15] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[3][1] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[3] ),
        .D(wr_data_IBUF[1]),
        .Q(\reg_file_reg_n_0_[3][1] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[3][2] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[3] ),
        .D(wr_data_IBUF[2]),
        .Q(\reg_file_reg_n_0_[3][2] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[3][3] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[3] ),
        .D(wr_data_IBUF[3]),
        .Q(\reg_file_reg_n_0_[3][3] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[3][4] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[3] ),
        .D(wr_data_IBUF[4]),
        .Q(\reg_file_reg_n_0_[3][4] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[3][5] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[3] ),
        .D(wr_data_IBUF[5]),
        .Q(\reg_file_reg_n_0_[3][5] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[3][6] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[3] ),
        .D(wr_data_IBUF[6]),
        .Q(\reg_file_reg_n_0_[3][6] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[3][7] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[3] ),
        .D(wr_data_IBUF[7]),
        .Q(\reg_file_reg_n_0_[3][7] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[3][8] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[3] ),
        .D(wr_data_IBUF[8]),
        .Q(\reg_file_reg_n_0_[3][8] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[3][9] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[3] ),
        .D(wr_data_IBUF[9]),
        .Q(\reg_file_reg_n_0_[3][9] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[4][0] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[4] ),
        .D(wr_data_IBUF[0]),
        .Q(\reg_file_reg_n_0_[4][0] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[4][10] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[4] ),
        .D(wr_data_IBUF[10]),
        .Q(\reg_file_reg_n_0_[4][10] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[4][11] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[4] ),
        .D(wr_data_IBUF[11]),
        .Q(\reg_file_reg_n_0_[4][11] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[4][12] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[4] ),
        .D(wr_data_IBUF[12]),
        .Q(\reg_file_reg_n_0_[4][12] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[4][13] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[4] ),
        .D(wr_data_IBUF[13]),
        .Q(\reg_file_reg_n_0_[4][13] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[4][14] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[4] ),
        .D(wr_data_IBUF[14]),
        .Q(\reg_file_reg_n_0_[4][14] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[4][15] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[4] ),
        .D(wr_data_IBUF[15]),
        .Q(\reg_file_reg_n_0_[4][15] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[4][1] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[4] ),
        .D(wr_data_IBUF[1]),
        .Q(\reg_file_reg_n_0_[4][1] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[4][2] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[4] ),
        .D(wr_data_IBUF[2]),
        .Q(\reg_file_reg_n_0_[4][2] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[4][3] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[4] ),
        .D(wr_data_IBUF[3]),
        .Q(\reg_file_reg_n_0_[4][3] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[4][4] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[4] ),
        .D(wr_data_IBUF[4]),
        .Q(\reg_file_reg_n_0_[4][4] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[4][5] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[4] ),
        .D(wr_data_IBUF[5]),
        .Q(\reg_file_reg_n_0_[4][5] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[4][6] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[4] ),
        .D(wr_data_IBUF[6]),
        .Q(\reg_file_reg_n_0_[4][6] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[4][7] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[4] ),
        .D(wr_data_IBUF[7]),
        .Q(\reg_file_reg_n_0_[4][7] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[4][8] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[4] ),
        .D(wr_data_IBUF[8]),
        .Q(\reg_file_reg_n_0_[4][8] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[4][9] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[4] ),
        .D(wr_data_IBUF[9]),
        .Q(\reg_file_reg_n_0_[4][9] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[5][0] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[5] ),
        .D(wr_data_IBUF[0]),
        .Q(\reg_file_reg_n_0_[5][0] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[5][10] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[5] ),
        .D(wr_data_IBUF[10]),
        .Q(\reg_file_reg_n_0_[5][10] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[5][11] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[5] ),
        .D(wr_data_IBUF[11]),
        .Q(\reg_file_reg_n_0_[5][11] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[5][12] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[5] ),
        .D(wr_data_IBUF[12]),
        .Q(\reg_file_reg_n_0_[5][12] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[5][13] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[5] ),
        .D(wr_data_IBUF[13]),
        .Q(\reg_file_reg_n_0_[5][13] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[5][14] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[5] ),
        .D(wr_data_IBUF[14]),
        .Q(\reg_file_reg_n_0_[5][14] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[5][15] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[5] ),
        .D(wr_data_IBUF[15]),
        .Q(\reg_file_reg_n_0_[5][15] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[5][1] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[5] ),
        .D(wr_data_IBUF[1]),
        .Q(\reg_file_reg_n_0_[5][1] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[5][2] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[5] ),
        .D(wr_data_IBUF[2]),
        .Q(\reg_file_reg_n_0_[5][2] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[5][3] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[5] ),
        .D(wr_data_IBUF[3]),
        .Q(\reg_file_reg_n_0_[5][3] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[5][4] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[5] ),
        .D(wr_data_IBUF[4]),
        .Q(\reg_file_reg_n_0_[5][4] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[5][5] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[5] ),
        .D(wr_data_IBUF[5]),
        .Q(\reg_file_reg_n_0_[5][5] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[5][6] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[5] ),
        .D(wr_data_IBUF[6]),
        .Q(\reg_file_reg_n_0_[5][6] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[5][7] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[5] ),
        .D(wr_data_IBUF[7]),
        .Q(\reg_file_reg_n_0_[5][7] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[5][8] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[5] ),
        .D(wr_data_IBUF[8]),
        .Q(\reg_file_reg_n_0_[5][8] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[5][9] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[5] ),
        .D(wr_data_IBUF[9]),
        .Q(\reg_file_reg_n_0_[5][9] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[6][0] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[6] ),
        .D(wr_data_IBUF[0]),
        .Q(\reg_file_reg_n_0_[6][0] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[6][10] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[6] ),
        .D(wr_data_IBUF[10]),
        .Q(\reg_file_reg_n_0_[6][10] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[6][11] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[6] ),
        .D(wr_data_IBUF[11]),
        .Q(\reg_file_reg_n_0_[6][11] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[6][12] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[6] ),
        .D(wr_data_IBUF[12]),
        .Q(\reg_file_reg_n_0_[6][12] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[6][13] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[6] ),
        .D(wr_data_IBUF[13]),
        .Q(\reg_file_reg_n_0_[6][13] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[6][14] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[6] ),
        .D(wr_data_IBUF[14]),
        .Q(\reg_file_reg_n_0_[6][14] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[6][15] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[6] ),
        .D(wr_data_IBUF[15]),
        .Q(\reg_file_reg_n_0_[6][15] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[6][1] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[6] ),
        .D(wr_data_IBUF[1]),
        .Q(\reg_file_reg_n_0_[6][1] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[6][2] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[6] ),
        .D(wr_data_IBUF[2]),
        .Q(\reg_file_reg_n_0_[6][2] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[6][3] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[6] ),
        .D(wr_data_IBUF[3]),
        .Q(\reg_file_reg_n_0_[6][3] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[6][4] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[6] ),
        .D(wr_data_IBUF[4]),
        .Q(\reg_file_reg_n_0_[6][4] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[6][5] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[6] ),
        .D(wr_data_IBUF[5]),
        .Q(\reg_file_reg_n_0_[6][5] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[6][6] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[6] ),
        .D(wr_data_IBUF[6]),
        .Q(\reg_file_reg_n_0_[6][6] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[6][7] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[6] ),
        .D(wr_data_IBUF[7]),
        .Q(\reg_file_reg_n_0_[6][7] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[6][8] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[6] ),
        .D(wr_data_IBUF[8]),
        .Q(\reg_file_reg_n_0_[6][8] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[6][9] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[6] ),
        .D(wr_data_IBUF[9]),
        .Q(\reg_file_reg_n_0_[6][9] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[7][0] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[7] ),
        .D(wr_data_IBUF[0]),
        .Q(\reg_file_reg_n_0_[7][0] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[7][10] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[7] ),
        .D(wr_data_IBUF[10]),
        .Q(\reg_file_reg_n_0_[7][10] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[7][11] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[7] ),
        .D(wr_data_IBUF[11]),
        .Q(\reg_file_reg_n_0_[7][11] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[7][12] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[7] ),
        .D(wr_data_IBUF[12]),
        .Q(\reg_file_reg_n_0_[7][12] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[7][13] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[7] ),
        .D(wr_data_IBUF[13]),
        .Q(\reg_file_reg_n_0_[7][13] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[7][14] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[7] ),
        .D(wr_data_IBUF[14]),
        .Q(\reg_file_reg_n_0_[7][14] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[7][15] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[7] ),
        .D(wr_data_IBUF[15]),
        .Q(\reg_file_reg_n_0_[7][15] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[7][1] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[7] ),
        .D(wr_data_IBUF[1]),
        .Q(\reg_file_reg_n_0_[7][1] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[7][2] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[7] ),
        .D(wr_data_IBUF[2]),
        .Q(\reg_file_reg_n_0_[7][2] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[7][3] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[7] ),
        .D(wr_data_IBUF[3]),
        .Q(\reg_file_reg_n_0_[7][3] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[7][4] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[7] ),
        .D(wr_data_IBUF[4]),
        .Q(\reg_file_reg_n_0_[7][4] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[7][5] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[7] ),
        .D(wr_data_IBUF[5]),
        .Q(\reg_file_reg_n_0_[7][5] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[7][6] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[7] ),
        .D(wr_data_IBUF[6]),
        .Q(\reg_file_reg_n_0_[7][6] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[7][7] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[7] ),
        .D(wr_data_IBUF[7]),
        .Q(\reg_file_reg_n_0_[7][7] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[7][8] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[7] ),
        .D(wr_data_IBUF[8]),
        .Q(\reg_file_reg_n_0_[7][8] ),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \reg_file_reg[7][9] 
       (.C(clk_IBUF_BUFG),
        .CE(\reg_file[7] ),
        .D(wr_data_IBUF[9]),
        .Q(\reg_file_reg_n_0_[7][9] ),
        .R(rst_IBUF));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  IBUF \wr_data_IBUF[0]_inst 
       (.I(wr_data[0]),
        .O(wr_data_IBUF[0]));
  IBUF \wr_data_IBUF[10]_inst 
       (.I(wr_data[10]),
        .O(wr_data_IBUF[10]));
  IBUF \wr_data_IBUF[11]_inst 
       (.I(wr_data[11]),
        .O(wr_data_IBUF[11]));
  IBUF \wr_data_IBUF[12]_inst 
       (.I(wr_data[12]),
        .O(wr_data_IBUF[12]));
  IBUF \wr_data_IBUF[13]_inst 
       (.I(wr_data[13]),
        .O(wr_data_IBUF[13]));
  IBUF \wr_data_IBUF[14]_inst 
       (.I(wr_data[14]),
        .O(wr_data_IBUF[14]));
  IBUF \wr_data_IBUF[15]_inst 
       (.I(wr_data[15]),
        .O(wr_data_IBUF[15]));
  IBUF \wr_data_IBUF[1]_inst 
       (.I(wr_data[1]),
        .O(wr_data_IBUF[1]));
  IBUF \wr_data_IBUF[2]_inst 
       (.I(wr_data[2]),
        .O(wr_data_IBUF[2]));
  IBUF \wr_data_IBUF[3]_inst 
       (.I(wr_data[3]),
        .O(wr_data_IBUF[3]));
  IBUF \wr_data_IBUF[4]_inst 
       (.I(wr_data[4]),
        .O(wr_data_IBUF[4]));
  IBUF \wr_data_IBUF[5]_inst 
       (.I(wr_data[5]),
        .O(wr_data_IBUF[5]));
  IBUF \wr_data_IBUF[6]_inst 
       (.I(wr_data[6]),
        .O(wr_data_IBUF[6]));
  IBUF \wr_data_IBUF[7]_inst 
       (.I(wr_data[7]),
        .O(wr_data_IBUF[7]));
  IBUF \wr_data_IBUF[8]_inst 
       (.I(wr_data[8]),
        .O(wr_data_IBUF[8]));
  IBUF \wr_data_IBUF[9]_inst 
       (.I(wr_data[9]),
        .O(wr_data_IBUF[9]));
  IBUF wr_enable_IBUF_inst
       (.I(wr_enable),
        .O(wr_enable_IBUF));
  IBUF \wr_index_IBUF[0]_inst 
       (.I(wr_index[0]),
        .O(wr_index_IBUF[0]));
  IBUF \wr_index_IBUF[1]_inst 
       (.I(wr_index[1]),
        .O(wr_index_IBUF[1]));
  IBUF \wr_index_IBUF[2]_inst 
       (.I(wr_index[2]),
        .O(wr_index_IBUF[2]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
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

endmodule
`endif
