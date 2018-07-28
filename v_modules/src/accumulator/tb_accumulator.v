module tb_accumulator();
reg clk, rst, init;
reg [7:0] in;
wire [7:0]out;

accumulator #(.bit_width(8)) DUT(
.clk(clk),
.rst(rst),
.init(init),
.in(in),
.out(out)
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
	init = 1'b0;
	@(negedge rst);
	repeat(2) @(posedge clk);
	@(posedge clk);
	in = 8'hF;
	init = 1'b0;
	@(posedge clk);
	in = 8'h3;
	init = 1'b0;
	@(posedge clk);
	in = 8'hF;
	init = 1'b0;
	@(posedge clk);
	in = 8'h8;
	init = 1'b1;
	@(posedge clk);
	in = 8'hF;
	init = 1'b0;
	@(posedge clk);
	in = 8'hC;
	init = 1'b0;
	@(posedge clk);
	$finish;
end

endmodule


