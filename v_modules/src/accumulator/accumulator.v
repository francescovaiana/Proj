module accumulator # (parameter bit_width=16) (clk, rst, init,  sign, in, out);

input clk, rst, init, sign;
input [bit_width-1:0] in;
output [bit_width-1:0] out;

wire [bit_width-1:0] mux_in_a, mux_out, reg_out;
wire zero;

//assign zero= 1'b0;
rca #(.bit_width(bit_width)) alu (
.a(reg_out),
.b(in),
.carry_in(sign),
.carry_out(zero),
.s(mux_in_a)
);

mux21_generic #(.bit_width(bit_width)) mux21 (
.a(mux_in_a),
.b(in),
.s(init),
.y(mux_out)
);

reg_gen #(.bit_width(bit_width)) reg_i (
.clk(clk),
.rst(rst),
.data_in(mux_out),
.data_out(reg_out)
);

assign out=reg_out;
endmodule
