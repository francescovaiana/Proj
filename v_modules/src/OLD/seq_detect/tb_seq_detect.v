module tb_seq_detect();
reg clk, rst, in, oe;
wire detect;

three_ones DUT(
.clk(clk),
.rst(rst),
.oe(oe),
.in(in),
.detect(detect)
);

initial begin
	clk = 1'b0;
	rst = 1'b1;
	repeat(4) #10 clk=~clk;
	rst = 1'b0;
	forever #10 clk=~clk;
end

initial begin
	oe = 1'b1;
	in = 1'b1;
	@(negedge rst);
	oe = 1'b0;
	repeat(5) @(posedge clk);
	oe = 1'b1;
	repeat(5) @(posedge clk);
	in = 1'b0;
	repeat(5) @(posedge clk);
	in = 1'b1;
	repeat(5) @(posedge clk);
	in = 1'b0;
	repeat(1) @(posedge clk);
	in = 1'b1;
	repeat(2) @(posedge clk);
	in = 1'b0;
	repeat(1) @(posedge clk);
	in = 1'b1;
	repeat(3) @(posedge clk);
	in = 1'b0;
	repeat(5) @(posedge clk);
	$finish;
end

endmodule


