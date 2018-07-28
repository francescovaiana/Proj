module demux # (parameter bit_width = 4) (i, sel, out_a, out_b);
input [bit_width-1:0] i;
input sel;
output [bit_width-1:0] out_a, out_b;

assign out_a = (sel==1'b0) ? i : {(bit_width){1'bz}};
assign out_b = (sel==1'b1) ? i : {(bit_width){1'bz}};
endmodule
 
