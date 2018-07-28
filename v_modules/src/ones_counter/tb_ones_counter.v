`timescale 1ns / 10ps

module tb_ones_counter();
reg clk, rst;
reg [31:0]word_in;
wire [5:0]count_out;

integer f, s_f;
ones_counter #(.bit_width(32)) DUT(
.clk(clk),
.rst(rst),
.word_in(word_in),
.count_out(count_out)
);

initial begin
	s_f = $fopen("sim_dump_postsyn","w"); 
	//f = $fopen("sim_dump.txt","w");
	clk = 1'b0;
	rst = 1'b1;
	repeat(4) #10 clk=~clk;
	rst = 1'b0;
	forever #10 clk=~clk;
end


initial begin
	word_in = 32'h00000;

	@(negedge rst);
	repeat(2) @(posedge clk);
	@(posedge clk);
	word_in = 32'hFFFFF;
	//$display("DUT %b", count_out);
	//$fwrite(f, "%b @time %5d\n", count_out, $time);
	@(posedge clk);
	word_in = 32'h4F168;
	//$display("DUT %b", count_out);
	//$fwrite(f, "%b @time %5d\n", count_out, $time);
	@(posedge clk);
	word_in = 32'hF000A;
	//$display("DUT %b", count_out);
	//$fwrite(f, "%b @time %5d\n", count_out, $time);
	@(posedge clk);
	word_in = 32'h66676;
	//$display("DUT %b", count_out);
	//$fwrite(f, "%b @time %5d\n", count_out, $time);
	repeat(4) @(posedge clk);
	//$fclose(f);
	$fclose(s_f);
	$finish;
end

initial forever begin
@(count_out);
$fwrite(s_f, "Value: count_out = %b @%0t\n", count_out, $time);
$display("Value: count_out = %b @%0t", count_out, $time);
end

endmodule


