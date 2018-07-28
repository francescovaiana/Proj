module tb_dispatcher();

parameter max_n_operations = 8;
parameter log_rom_size = 8;
parameter log_n_mul = 3;
parameter log_n_add = 3;
parameter log_bit_width = 3;
parameter ctrl_bit=1;

reg clk, rst;
reg read_data, read_weigth, acc_addr_en, acc_op_en, load_n_op, load_base_addr;
reg [max_n_operations-1:0] init_n_operations;
reg [log_rom_size-1:0] init_base_addr;
reg [2**log_n_mul-1:0] stall_word;
reg [2**log_n_mul-1:0] feedback_sel; 
reg [2**(log_n_mul)*(2**(log_bit_width)+ctrl_bit)-1:0] output_data_reuse;
wire [2**(log_n_mul)*2**(log_bit_width)-1:0] mult_in_data;
wire [2**(log_n_mul)*2**(log_bit_width)-1:0] mult_in_weigth;
wire  end_conv_layer;

dispatcher #(
  .rom_data_init("./dispatcher/rom_data.mem"),
  .rom_weigth_init("./dispatcher/rom_weigth.mem"), 
  .max_n_operations(max_n_operations), 
  .log_rom_size(log_rom_size),
  .log_n_mul(log_n_mul),
  .log_n_add(log_n_add),
  .log_bit_width(log_bit_width),
  .ctrl_bit(ctrl_bit)
) DUT(
  .clk(clk),
  .rst(rst),
  .read_data(read_data),
  .read_weigth(read_weigth),
  .load_n_op(load_n_op),
  .load_base_addr(load_base_addr),
  .acc_addr_en(acc_addr_en),
  .acc_op_en(acc_op_en),
  .init_n_operations(init_n_operations),
  .init_base_addr(init_base_addr),
  .stall_word(stall_word),
  .feedback_sel(feedback_sel),
  .output_data_reuse(output_data_reuse),
  .mult_in_data(mult_in_data),
  .mult_in_weigth(mult_in_weigth),
  .end_conv_layer(end_conv_layer)
);

initial begin
	clk = 1'b0;
	rst = 1'b1;
	repeat(4) #10 clk=~clk;
	rst = 1'b0;
	forever #10 clk=~clk;
end

initial begin
//clk, read, stall_word4, addr8;
	@(negedge rst);
	//Reset;
	read_data = 1'b0;
	read_weigth = 1'b0;
	load_n_op = 1'b0;
	load_base_addr = 1'b0;
	acc_addr_en = 1'b0;
	acc_op_en = 1'b0;
	init_n_operations = 8'h00;
	init_base_addr = 8'h00; 
	stall_word = 8'h00;
	feedback_sel = 8'h00;
	output_data_reuse = 64'h0000000000000000;
	repeat(2) @(posedge clk);
	@(posedge clk);
	//Prepare first test - no stall;
	read_data = 1'b0;
	read_weigth = 1'b0;
	load_n_op = 1'b1;
	load_base_addr = 1'b1;
	acc_addr_en = 1'b1;
	acc_op_en = 1'b1;
	init_n_operations = 8'h20;
	init_base_addr = 8'h60; 
	stall_word = 8'h00;
	feedback_sel = 8'h00;
	output_data_reuse = 64'h0000000000000000;
	@(posedge clk);
	//Exec first test - no stall;
	read_data = 1'b1;
	read_weigth = 1'b1;
	load_n_op = 1'b0;
	load_base_addr = 1'b0;
	acc_addr_en = 1'b1;
	acc_op_en = 1'b1;
	init_n_operations = 8'h00;
	init_base_addr = 8'h00; 
	stall_word = 8'h00;
	feedback_sel = 8'h00;
	output_data_reuse = 64'h0000000000000000;
	repeat (4)@(posedge clk);
	//Reset;
	read_data = 1'b0;
	read_weigth = 1'b0;
	load_n_op = 1'b0;
	load_base_addr = 1'b0;
	acc_addr_en = 1'b0;
	acc_op_en = 1'b0;
	init_n_operations = 8'h00;
	init_base_addr = 8'h00; 
	stall_word = 8'h00;
	feedback_sel = 8'h00;
	output_data_reuse = 64'h0000000000000000;
	@(posedge clk);
	//Prepare second test - 1 stall in between;
	read_data = 1'b0;
	read_weigth = 1'b0;
	load_n_op = 1'b1;
	load_base_addr = 1'b1;
	acc_addr_en = 1'b1;
	acc_op_en = 1'b1;
	init_n_operations = 8'h20;
	init_base_addr = 8'h60; 
	stall_word = 8'h00;
	feedback_sel = 8'h00;
	output_data_reuse = 64'h0000000000000000;
	@(posedge clk);
	//2 C.C. without stall;
	read_data = 1'b1;
	read_weigth = 1'b1;
	load_n_op = 1'b0;
	load_base_addr = 1'b0;
	acc_addr_en = 1'b1;
	acc_op_en = 1'b1;
	init_n_operations = 8'h00;
	init_base_addr = 8'h00; 
	stall_word = 8'h00;
	feedback_sel = 8'h00;
	output_data_reuse = 64'h0000000000000000;
	repeat (2)@(posedge clk);
	//2 C.C. with 5 stall;
	read_data = 1'b1;
	read_weigth = 1'b1;
	load_n_op = 1'b0;
	load_base_addr = 1'b0;
	acc_addr_en = 1'b1;
	acc_op_en = 1'b1;
	init_n_operations = 8'h00;
	init_base_addr = 8'h00; 
	stall_word = 8'hA4;
	feedback_sel = 8'h00;
	output_data_reuse = 64'h0000000000000000;
	repeat (2)@(posedge clk);
	//2 C.C. without stall and end;
	read_data = 1'b1;
	read_weigth = 1'b1;
	load_n_op = 1'b0;
	load_base_addr = 1'b0;
	acc_addr_en = 1'b1;
	acc_op_en = 1'b1;
	init_n_operations = 8'h00;
	init_base_addr = 8'h00; 
	stall_word = 8'h00;
	feedback_sel = 8'h00;
	output_data_reuse = 64'h0000000000000000;
	repeat (2)@(posedge clk);
	//Reset
	read_data = 1'b0;
	read_weigth = 1'b0;
	load_n_op = 1'b0;
	load_base_addr = 1'b0;
	acc_addr_en = 1'b0;
	acc_op_en = 1'b0;
	init_n_operations = 8'h00;
	init_base_addr = 8'h00; 
	stall_word = 8'h00;
	feedback_sel = 8'h00;
	output_data_reuse = 64'h0000000000000000;
	@(posedge clk);
	$finish;
end

endmodule


