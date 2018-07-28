module encoder (b, o);
input [2:0] b;
output [2:0] o;

assign o[2] = b[2] & ~b[1] & ~b[0];
assign o[1] = (~b[2] & b[1] & b[0]) | (b[2] & ~b[1]) | (b[2] & ~b[0]);
assign o[0] = (~b[2] & b[0]) | (~b[2] & b[1]);
endmodule
