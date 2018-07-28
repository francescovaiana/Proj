module tb_nand();
reg clk, rst, a, b;
wire y;

nand2 DUT(
.a(a),
.b(b),
.y(y)
);

initial begin
	clk = 1'b0;
	rst = 1'b1;
	repeat(4) #10 clk=~clk;
	rst = 1'b0;
	forever #10 clk=~clk;
end

initial begin
	a = 1'b1;
	b = 1'b1;
	@(negedge rst);
	b = 1'b1;
	repeat(5) @(posedge clk);
	b = 1'b0;
	repeat(5) @(posedge clk);
	a = 1'b0;
	b = 1'b1;
	repeat(5) @(posedge clk);
	b = 1'b0;
	repeat(5) @(posedge clk);
	$finish;
end

endmodule


