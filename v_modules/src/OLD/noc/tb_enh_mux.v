module tb_enh_mux();
reg clk, rst;
reg [16:0] in_1, in_2;
wire [16:0] out;
wire full_1, full_2;
enh_mux #(.word_width(17), .val_bit(1), .log_buffer_len(2)) DUT(
.clk(clk),
.rst(rst),
.in_1(in_1),
.in_2(in_2),
.out(out),
.full_1(full_1),
.full_2(full_2)
);

initial begin
	clk = 1'b0;
	rst = 1'b1;
	repeat(4) #10 clk=~clk;
	rst = 1'b0;
	forever #10 clk=~clk;
end

initial begin
	in_1 = 17'h00000;
 	in_2 = 17'h0000;
	@(negedge rst);
	in_1 = 17'h0000F;
	repeat(17) @(posedge clk);
	in_2 = 17'h0000F;
	repeat(17) @(posedge clk);
	in_1 = 17'h1808F;
	repeat(17) @(posedge clk);
	in_1 = 17'h00008;
	in_2 = 17'h1AAAA;	
	repeat(17) @(posedge clk);
	in_1 = 17'h00001;
	in_2 = 17'h00005;
	repeat(17) @(posedge clk);
	in_1 = 17'h1A0A0;
	in_2 = 17'h1B0B0;
	repeat(17) @ (posedge clk);
	in_1 = 17'h00A0A;
	in_2 = 17'h00B0B;
	repeat(32) @ (posedge clk);
	
	$finish;
end

endmodule


