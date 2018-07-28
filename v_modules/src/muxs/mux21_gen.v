module mux21_generic # (parameter bit_width = 16) (a, b, s, y);
input [bit_width-1:0] a;
input [bit_width-1:0] b;
input s;
output [bit_width-1:0] y;

assign y = (s==1'b0) ? a : b;
endmodule
