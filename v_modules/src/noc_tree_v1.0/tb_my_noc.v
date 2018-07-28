module tb_my_noc();
parameter lognadd=3;
parameter lognmul=4;
parameter valbit=1;
parameter bitwidth=4;
//Word composed of
//|V|ADD|DATA|
reg clk0, clk1, clk2, rst;
reg [2**(lognmul)*(valbit+lognadd+bitwidth)-1:0] in;
wire [2**(lognmul)*(valbit+lognadd+bitwidth)-1:0] noc_in;
wire [2**(lognadd)*(bitwidth)-1:0] out;
wire [2**(lognmul)-1:0] stall;
reg [2**(lognmul)-1:0] ld;
reg [2**(lognmul)-1:0] sh;

genvar i;
generate
for (i=0; i<2**lognmul; i=i+1) begin
rotate_reg #(.bit_width(valbit+lognadd+bitwidth)) STIM (
.clk(clk0),
.rst(rst),
.ld(ld[i]),
.sh(sh[i]),
.data_in(in[(i+1)*(valbit+lognadd+bitwidth)-1-:(valbit+lognadd+bitwidth)]),
.data_out(noc_in[(i+1)*(valbit+lognadd+bitwidth)-1-:(valbit+lognadd+bitwidth)])
);
end
endgenerate

my_noc #(.bit_width(bitwidth), .log_n_mul(lognmul), .log_n_add(lognadd), .ctrl_bit(valbit)) DUT(
.clk({clk2, clk1, clk0}),
.rst(rst),
.in(noc_in),
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
	in = 128'h00000000000000000000000000000000;
	sh = 16'h0000;
	ld = 16'h0000;
	@(negedge rst);
	in = 128'hFAC123B658907E4DFAC123B658907E4D;
	ld = 16'hFFFF;
	sh = 16'h0000;
	repeat(2)@ (posedge clk0);
	in = 128'h00000000000000000000000000000000;
	sh = 16'hFFFF;
	ld = 16'h0000;
	repeat(32) @ (posedge clk0);
	in = 128'h00000000000000000000000000000000;
	sh = 16'h0000;
	ld = 16'hFFFF;
	repeat(1) @ (posedge clk0);
	in = 128'h00000000000000000000000000000000;
	sh = 16'h0000;
	ld = 16'h0000;
	repeat(128) @ (posedge clk0);
	//in = 128'h000000123456789ABCDEF;
	//@ (posedge clk0);
	//in = 128'h000000000000000000000;
	//repeat(32)@ (posedge clk0);
	//in = 128'hFEDCBA987654321000000;
	//@ (posedge clk0);
	//in = 128'h000000000000000000000;
	//repeat(32)@ (posedge clk0);
	$finish;
end

endmodule


