module mul # (parameter bit_width = 16) (a, b, o);
input [bit_width-1:0] a, b;
output [2*bit_width-1:0] o;

wire [2*bit_width-1:0] a_tmp, b_tmp;

assign a_tmp = {{(bit_width){a[bit_width-1]}}, {a}};
assign b_tmp = {{(bit_width){b[bit_width-1]}}, {b}};
assign o = a_tmp*b_tmp;
endmodule
