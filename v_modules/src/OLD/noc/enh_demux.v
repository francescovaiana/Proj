module enh_demux #(parameter bit_width = 17)(in, out1, out2);
input [bit_width-1:0] in;
output [bit_width-2:0] out1, out2;

demux # (.bit_width(bit_width-1)) demux_i (
.i(in[bit_width-2:0]),
.sel(in[bit_width-1]),
.out_a(out1),
.out_b(out2)
);

endmodule
