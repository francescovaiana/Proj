module tb_my_noc();
parameter lognadd=3;
parameter lognmul=4;
parameter valbit=1;
parameter bitwidth=2;
//Word composed of
//|V|ADD|DATA|
reg clk0, clk1, clk2, rst;
reg [2**(lognmul)*(valbit+lognadd+bitwidth)-1:0] in;
wire [2**(lognadd)*(bitwidth)-1:0] out;
wire [2**(lognmul)-1:0] stall;

my_noc #(.bit_width(bitwidth), .log_n_mul(lognmul), .log_n_add(lognadd), .ctrl_bit(valbit)) DUT(
.clk({clk2, clk1, clk0}),
.rst(rst),
.in(in),
.out(out),
.stall(stall)
);

initial begin
	clk2 = 1'b1;
	rst = 1'b1;
	repeat(4) #10 clk2=~clk2;
	rst = 1'b0;
	forever #10 clk2=~clk2;
end

initial begin
	clk1 = 1'b1;
	forever #20 clk1=~clk1;	
end

initial begin 
	clk0 = 1'b1;
	forever #40 clk0=~clk0;
end

initial begin
	in = 96'h000000000000000000000;
	@(negedge rst);
	repeat(2) @(posedge clk0);
	in = 96'hFA000000C123B65897E4D;
	@ (posedge clk0);
	in = 96'h000000000000000000000;
	repeat(32) @ (posedge clk0);
	in = 96'h000000123456789ABCDEF;
	@ (posedge clk0);
	in = 96'h000000000000000000000;
	repeat(32)@ (posedge clk0);
	in = 96'hFEDCBA987654321000000;
	@ (posedge clk0);
	in = 96'h000000000000000000000;
	repeat(32)@ (posedge clk0);
	$finish;
end

endmodule


