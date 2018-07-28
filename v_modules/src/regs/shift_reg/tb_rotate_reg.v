module tb_rotate_reg();
reg clk, rst, ld, sh;
reg [7:0] in;
wire [7:0]y;

rotate_reg #(.bit_width(8)) DUT(
.clk(clk),
.rst(rst),
.ld(ld),
.sh(sh),
.data_in(in),
.data_out(y)
);

initial begin
	clk = 1'b0;
	rst = 1'b1;
	repeat(4) #10 clk=~clk;
	rst = 1'b0;
	forever #10 clk=~clk;
end

initial begin
	ld = 1'b0;
	sh = 1'b0;
	in = 8'h00;
	@(negedge rst);
	repeat(2) @(posedge clk);
	ld = 1'b0;
	sh = 1'b0;
	in = 8'h7A;
	@(posedge clk);
	ld = 1'b1;
	sh = 1'b0;
	in = 8'h7A;
	@(posedge clk);
	ld = 1'b0;
	sh = 1'b0;
	in = 8'hAA;
	@(posedge clk);
	ld = 1'b0;
	sh = 1'b1;
	in = 8'h9A;
	@(posedge clk);
	ld = 1'b0;
	sh = 1'b0;
	in = 8'h9A;
	@(posedge clk);
	ld = 1'b1;
	sh = 1'b1;
	in = 8'hf3;
	@(posedge clk);
	ld = 1'b0;
	sh = 1'b0;
	in = 8'h9A;
	@(posedge clk);
	ld = 1'b0;
	sh = 1'b1;
	in = 8'h95;
	repeat (16) @(posedge clk);
	ld = 1'b0;
	sh = 1'b0;
	in = 8'h00;
	$finish;
end

endmodule


