module tb_my_noc();
reg clk0, clk1, clk2, rst;
reg [4*16-1:0] in;
wire [3:0] out;
wire [15:0] stall;

my_noc #(.bit_width(2), .log_n_mul(4), .log_n_add(1), .ctrl_bit(1)) DUT(
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
	in = 64'h0000000000000000;
	@(negedge rst);
	repeat(2) @(posedge clk0);
	in = 64'hFA0C123B65897E4D;
	@ (posedge clk0);
	in = 64'h0000000000000000;
	repeat(32) @ (posedge clk0);
	in = 64'h0123456789ABCDEF;
	@ (posedge clk0);
	in = 64'h0000000000000000;
	repeat(32)@ (posedge clk0);
	in = 64'hFEDCBA9876543210;
	@ (posedge clk0);
	in = 64'h0000000000000000;
	repeat(32)@ (posedge clk0);
	$finish;
end

endmodule


