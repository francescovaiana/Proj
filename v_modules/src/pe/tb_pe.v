module tb_pe();

parameter max_n_operations = 10;
parameter log_rom_size = 11;
parameter log_n_mul = 3;
parameter log_n_add = 3;
parameter log_bit_width = 3;
parameter ctrl_bit=1;

reg [log_n_mul/2:0]clk;
reg rst;
reg read_data, read_weigth, acc_addr_en, acc_op_en, load_n_op, load_base_addr, load_bias;
reg [max_n_operations-1:0] init_n_operations;
reg [log_rom_size-1:0] init_base_addr;
reg [2**log_n_mul-1:0] feedback_sel;
reg [2**(log_n_add)*2**(log_bit_width)-1:0] bias_in;
wire end_conv_layer;
wire [(2**log_n_add)*(2**(log_bit_width+1))-1:0] output_reuse;
integer f;

processing_element #(
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
  .load_bias(load_bias),
  .acc_addr_en(acc_addr_en),
  .acc_op_en(acc_op_en),
  .init_n_operations(init_n_operations),
  .init_base_addr(init_base_addr),
  .feedback_sel(feedback_sel),
  .bias_in(bias_in),
  .output_reuse(output_reuse),
  .end_conv_layer(end_conv_layer)
);

initial begin
f = $fopen("sim.dump", "w");
$fwrite(f, "Net Out array \tTime \n");
	clk[2] = 1'b1;
	rst = 1'b1;
	repeat(4) #10 clk[2]=~clk[2];
	rst = 1'b0;
	forever #10 clk[2]=~clk[2];
end

initial begin
	clk[1] = 1'b1;
	forever #20 clk[1]=~clk[1];	
end

initial begin 
	clk[0] = 1'b1;
	forever #40 clk[0]=~clk[0];
end

initial begin
//clk, read, stall_word4, addr8;
	read_data = 1'b0;
	read_weigth = 1'b0;
	load_n_op = 1'b0;
	load_base_addr = 1'b0;
	load_bias = 1'b0;
	acc_addr_en = 1'b0;
	acc_op_en = 1'b0;
	init_n_operations = 10'h000;
	init_base_addr = 8'h00; 
	feedback_sel = 8'h00;
	bias_in = 64'h0000000000000000;
	@(negedge rst);
	//Reset;
	read_data = 1'b0;
	read_weigth = 1'b0;
	load_n_op = 1'b0;
	load_base_addr = 1'b0;
	load_bias = 1'b0;
	acc_addr_en = 1'b0;
	acc_op_en = 1'b0;
	init_n_operations = 10'h000;
	init_base_addr = 8'h00; 
	feedback_sel = 8'h00;
	bias_in = 64'h0000000000000000;
	repeat(4) @(posedge clk);
	//Prepare first test - no stall;
	read_data = 1'b0;
	read_weigth = 1'b0;
	load_n_op = 1'b1;
	load_base_addr = 1'b1;
	load_bias = 1'b0;
	acc_addr_en = 1'b1;
	acc_op_en = 1'b1;
	init_n_operations = 10'h40;
	init_base_addr = 8'h00; 
	feedback_sel = 8'h00;
	bias_in = 64'h0000000000000000;
	@(posedge clk);
	//Exec first test - no stall;
	read_data = 1'b1;
	read_weigth = 1'b1;
	load_n_op = 1'b0;
	load_base_addr = 1'b0;
	load_bias = 1'b0;
	acc_addr_en = 1'b1;
	acc_op_en = 1'b1;
	init_n_operations = 10'h00;
	init_base_addr = 8'h00; 
	feedback_sel = 8'h00;
	bias_in = 64'h0000000000000000;
	repeat (1024) @(posedge clk[0]);
	read_data = 1'b0;
	read_weigth = 1'b0;
	load_n_op = 1'b0;
	load_base_addr = 1'b0;
	load_bias = 1'b0;
	acc_addr_en = 1'b0;
	acc_op_en = 1'b0;
	init_n_operations = 10'h000;
	init_base_addr = 8'h00; 
	feedback_sel = 8'h00;
	bias_in = 64'h0000000000000000;
	//Prepare second test - 1 stall in between;
	//2 C.C. without stall;
	//2 C.C. with 5 stall;
	//2 C.C. without stall and end;
	//Reset
	repeat(512)@(posedge clk[0]);
	$fclose(f);
	$finish;
end

initial forever begin
@(tb_pe.DUT.acc_in_arr[7]);
$fwrite(f, "%d \t@time %5d\n", $signed(tb_pe.DUT.acc_in_arr[7]), $time);
end

endmodule


