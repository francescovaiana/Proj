module tb_rca();
reg clk, rst, carry_in;
reg [7:0] a , b;
wire [7:0]out;
wire carry_out;

rca #(.bit_width(8)) DUT(
.a(a),
.b(b),
.carry_in(carry_in),
.s(out),
.carry_out(carry_out)
);

initial begin
	clk = 1'b0;
	rst = 1'b1;
	repeat(4) #10 clk=~clk;
	rst = 1'b0;
	forever #10 clk=~clk;
end

initial begin
	a = 8'h0;
	b = 8'h0;
	carry_in = 1'b1;
	@(negedge rst);
	repeat(2) @(posedge clk);
	@(posedge clk);
	a = 8'hF;
	b = 8'h0;
	carry_in = 1'b1;
	@(posedge clk);
	a = 8'h0;
	b = 8'hF;
	carry_in = 1'b1;
	@(posedge clk);
	a = 8'hF0;
	b = 8'h0F;
	carry_in = 1'b1;
	@(posedge clk);
	a = 8'hF0;
	b = 8'h0F;
	carry_in = 1'b1;
	@(posedge clk);
	a = 8'hFF;
	b = 8'hFF;
	carry_in = 1'b1;
	@(posedge clk);
	a = 8'h3C;
	b = 8'h04;
	carry_in = 1'b1;
	@(posedge clk);
	$finish;
end

endmodule


