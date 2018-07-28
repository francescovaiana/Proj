module tb_rom();
reg clk, rst;
reg read;
reg [3:0] stall_word;
wire [2:0] n_v_out;
reg [7:0] addr;
wire [4*9-1:0]data_out;
wire [2:0] n_stall;

custom_rom #(
  .rom_init("rom_data.mem"),
  .log_bit_width(3),
  .ctrl_bit(1),
  .log_rom_size(8),
  .log_out_ports(2)
) DUT(
  .clk(clk),
  .read(read),
  .stall_word(stall_word),
  .n_v_out(n_v_out),
  .addr(addr),
  .data_out(data_out)
);

ones_counter #(
  .log_bit_width(2)
) O_C (
  .word_in(stall_word),
  .count_out(n_stall)
);

assign n_v_out = 3'b100-n_stall;

initial begin
	clk = 1'b0;
	rst = 1'b1;
	repeat(4) #10 clk=~clk;
	rst = 1'b0;
	forever #10 clk=~clk;
end

initial begin
//clk, read, stall_word4, addr8;
	read=1'b0;
	stall_word=4'h0;
	addr=8'h00;
	@(negedge rst);
	repeat(2) @(posedge clk);
	read=1'b1;
	stall_word=4'h0;
	addr=8'h10;
	@(posedge clk);
	read=1'b1;
	stall_word=4'h0;
	addr=8'h14;
	@(posedge clk);
	read=1'b1;
	stall_word=4'h0;
	addr=8'h28;
	@(posedge clk);
	read=1'b1;
	stall_word=4'h2;
	addr=8'h3B;
	@(posedge clk);
	read=1'b0;
	stall_word=4'h0;
	addr=8'h50;
	@(posedge clk);
	read=1'b1;
	stall_word=4'hF;
	addr=8'h20;
	@(posedge clk);
	read=1'b1;
	stall_word=4'hA;
	addr=8'h33;
	@(posedge clk);
	$finish;
end

endmodule


