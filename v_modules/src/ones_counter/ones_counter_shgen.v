module ones_counter_shgen #(parameter log_bit_width=5) (clk, rst, word_in, count_out);

input clk, rst;
input [2**log_bit_width-1 : 0] word_in;
output [log_bit_width : 0] count_out;

wire zero;
wire [2**log_bit_width-1:0]seq_in;
wire [log_bit_width : 0] seq_out;
//wire [2**log_bit_width-1:0]mat_temp[log_bit_width:0][2**(log_bit_width)-1:0];
//wire [2**log_bit_width-1:0] count_out_temp;
genvar i, j;

wire [0:0] net0_0,net0_1,net0_2,net0_3,net0_4,net0_5,net0_6,net0_7,net0_8,net0_9,net0_10,net0_11,net0_12,net0_13,net0_14,net0_15,net0_16,net0_17,net0_18,net0_19,net0_20,net0_21,net0_22,net0_23,net0_24,net0_25,net0_26,net0_27,net0_28,net0_29,net0_30,net0_31;
wire [1:0] net1_0,net1_1,net1_2,net1_3,net1_4,net1_5,net1_6,net1_7,net1_8,net1_9,net1_10,net1_11,net1_12,net1_13,net1_14,net1_15;
wire [2:0] net2_0,net2_1,net2_2,net2_3,net2_4,net2_5,net2_6,net2_7;
wire [3:0] net3_0,net3_1,net3_2,net3_3;
wire [4:0] net4_0,net4_1;
wire [5:0] net5_0;

reg_gen 
  #(.bit_width(2**log_bit_width))
reg_in (
  .clk(clk),
  .rst(rst),
  .data_in(word_in),
  .data_out(seq_in)
);

reg_gen 
  #(.bit_width(log_bit_width+1))
reg_out (
  .clk(clk),
  .rst(rst),
  .data_in(seq_out),
  .data_out(count_out)
);

assign net0_0 = seq_in[0];
assign net0_1 = seq_in[1];
assign net0_2 = seq_in[2];
assign net0_3 = seq_in[3];
assign net0_4 = seq_in[4];
assign net0_5 = seq_in[5];
assign net0_6 = seq_in[6];
assign net0_7 = seq_in[7];
assign net0_8 = seq_in[8];
assign net0_9 = seq_in[9];
assign net0_10 = seq_in[10];
assign net0_11 = seq_in[11];
assign net0_12 = seq_in[12];
assign net0_13 = seq_in[13];
assign net0_14 = seq_in[14];
assign net0_15 = seq_in[15];
assign net0_16 = seq_in[16];
assign net0_17 = seq_in[17];
assign net0_18 = seq_in[18];
assign net0_19 = seq_in[19];
assign net0_20 = seq_in[20];
assign net0_21 = seq_in[21];
assign net0_22 = seq_in[22];
assign net0_23 = seq_in[23];
assign net0_24 = seq_in[24];
assign net0_25 = seq_in[25];
assign net0_26 = seq_in[26];
assign net0_27 = seq_in[27];
assign net0_28 = seq_in[28];
assign net0_29 = seq_in[29];
assign net0_30 = seq_in[30];
assign net0_31 = seq_in[31];

rca #(
	.bit_width(1))
adder_0_0(
	.a(net0_0),
	.b(net0_1),
	.carry_in(zero),
	.s(net1_0[0:0]),
	.carry_out(net1_0[1])
);
rca #(
	.bit_width(1))
adder_0_1(
	.a(net0_2),
	.b(net0_3),
	.carry_in(zero),
	.s(net1_1[0:0]),
	.carry_out(net1_1[1])
);
rca #(
	.bit_width(1))
adder_0_2(
	.a(net0_4),
	.b(net0_5),
	.carry_in(zero),
	.s(net1_2[0:0]),
	.carry_out(net1_2[1])
);
rca #(
	.bit_width(1))
adder_0_3(
	.a(net0_6),
	.b(net0_7),
	.carry_in(zero),
	.s(net1_3[0:0]),
	.carry_out(net1_3[1])
);
rca #(
	.bit_width(1))
adder_0_4(
	.a(net0_8),
	.b(net0_9),
	.carry_in(zero),
	.s(net1_4[0:0]),
	.carry_out(net1_4[1])
);
rca #(
	.bit_width(1))
adder_0_5(
	.a(net0_10),
	.b(net0_11),
	.carry_in(zero),
	.s(net1_5[0:0]),
	.carry_out(net1_5[1])
);
rca #(
	.bit_width(1))
adder_0_6(
	.a(net0_12),
	.b(net0_13),
	.carry_in(zero),
	.s(net1_6[0:0]),
	.carry_out(net1_6[1])
);
rca #(
	.bit_width(1))
adder_0_7(
	.a(net0_14),
	.b(net0_15),
	.carry_in(zero),
	.s(net1_7[0:0]),
	.carry_out(net1_7[1])
);
rca #(
	.bit_width(1))
adder_0_8(
	.a(net0_16),
	.b(net0_17),
	.carry_in(zero),
	.s(net1_8[0:0]),
	.carry_out(net1_8[1])
);
rca #(
	.bit_width(1))
adder_0_9(
	.a(net0_18),
	.b(net0_19),
	.carry_in(zero),
	.s(net1_9[0:0]),
	.carry_out(net1_9[1])
);
rca #(
	.bit_width(1))
adder_0_10(
	.a(net0_20),
	.b(net0_21),
	.carry_in(zero),
	.s(net1_10[0:0]),
	.carry_out(net1_10[1])
);
rca #(
	.bit_width(1))
adder_0_11(
	.a(net0_22),
	.b(net0_23),
	.carry_in(zero),
	.s(net1_11[0:0]),
	.carry_out(net1_11[1])
);
rca #(
	.bit_width(1))
adder_0_12(
	.a(net0_24),
	.b(net0_25),
	.carry_in(zero),
	.s(net1_12[0:0]),
	.carry_out(net1_12[1])
);
rca #(
	.bit_width(1))
adder_0_13(
	.a(net0_26),
	.b(net0_27),
	.carry_in(zero),
	.s(net1_13[0:0]),
	.carry_out(net1_13[1])
);
rca #(
	.bit_width(1))
adder_0_14(
	.a(net0_28),
	.b(net0_29),
	.carry_in(zero),
	.s(net1_14[0:0]),
	.carry_out(net1_14[1])
);
rca #(
	.bit_width(1))
adder_0_15(
	.a(net0_30),
	.b(net0_31),
	.carry_in(zero),
	.s(net1_15[0:0]),
	.carry_out(net1_15[1])
);

rca #(
	.bit_width(2))
adder_1_0(
	.a(net1_0),
	.b(net1_1),
	.carry_in(zero),
	.s(net2_0[1:0]),
	.carry_out(net2_0[2])
);
rca #(
	.bit_width(2))
adder_1_1(
	.a(net1_2),
	.b(net1_3),
	.carry_in(zero),
	.s(net2_1[1:0]),
	.carry_out(net2_1[2])
);
rca #(
	.bit_width(2))
adder_1_2(
	.a(net1_4),
	.b(net1_5),
	.carry_in(zero),
	.s(net2_2[1:0]),
	.carry_out(net2_2[2])
);
rca #(
	.bit_width(2))
adder_1_3(
	.a(net1_6),
	.b(net1_7),
	.carry_in(zero),
	.s(net2_3[1:0]),
	.carry_out(net2_3[2])
);
rca #(
	.bit_width(2))
adder_1_4(
	.a(net1_8),
	.b(net1_9),
	.carry_in(zero),
	.s(net2_4[1:0]),
	.carry_out(net2_4[2])
);
rca #(
	.bit_width(2))
adder_1_5(
	.a(net1_10),
	.b(net1_11),
	.carry_in(zero),
	.s(net2_5[1:0]),
	.carry_out(net2_5[2])
);
rca #(
	.bit_width(2))
adder_1_6(
	.a(net1_12),
	.b(net1_13),
	.carry_in(zero),
	.s(net2_6[1:0]),
	.carry_out(net2_6[2])
);
rca #(
	.bit_width(2))
adder_1_7(
	.a(net1_14),
	.b(net1_15),
	.carry_in(zero),
	.s(net2_7[1:0]),
	.carry_out(net2_7[2])
);

rca #(
	.bit_width(3))
adder_2_0(
	.a(net2_0),
	.b(net2_1),
	.carry_in(zero),
	.s(net3_0[2:0]),
	.carry_out(net3_0[3])
);
rca #(
	.bit_width(3))
adder_2_1(
	.a(net2_2),
	.b(net2_3),
	.carry_in(zero),
	.s(net3_1[2:0]),
	.carry_out(net3_1[3])
);
rca #(
	.bit_width(3))
adder_2_2(
	.a(net2_4),
	.b(net2_5),
	.carry_in(zero),
	.s(net3_2[2:0]),
	.carry_out(net3_2[3])
);
rca #(
	.bit_width(3))
adder_2_3(
	.a(net2_6),
	.b(net2_7),
	.carry_in(zero),
	.s(net3_3[2:0]),
	.carry_out(net3_3[3])
);

rca #(
	.bit_width(4))
adder_3_0(
	.a(net3_0),
	.b(net3_1),
	.carry_in(zero),
	.s(net4_0[3:0]),
	.carry_out(net4_0[4])
);
rca #(
	.bit_width(4))
adder_3_1(
	.a(net3_2),
	.b(net3_3),
	.carry_in(zero),
	.s(net4_1[3:0]),
	.carry_out(net4_1[4])
);

rca #(
	.bit_width(5))
adder_4_0(
	.a(net4_0),
	.b(net4_1),
	.carry_in(zero),
	.s(net5_0[4:0]),
	.carry_out(net5_0[5])
);

assign zero = 1'b0; 
assign seq_out = net5_0;
endmodule