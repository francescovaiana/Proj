module tb_demux();
reg clk, rst, sel;
reg [7:0] in;
wire [7:0]out1, out2;

demux #(.bit_width(8)) DUT(
.i(in),
.sel(sel),
.out_a(out1),
.out_b(out2)
);

initial begin
	clk = 1'b0;
	rst = 1'b1;
	repeat(4) #10 clk=~clk;
	rst = 1'b0;
	forever #10 clk=~clk;
end

initial begin
	in = 8'h0;
	sel = 1'b0;
	@(negedge rst);
	in = 8'h10;
	sel = 1'b1;
	@(posedge clk);
	in = 8'h20;
	@(posedge clk);
	sel = 1'b0;
	$finish;
end

endmodule


