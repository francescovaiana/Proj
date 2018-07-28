module dispatcher #(parameter rom_data_init="rom_data.mem", rom_weigth_init="rom_weigth.mem", max_n_operations=32, log_rom_size=16, log_n_mul=5, log_n_add=5, log_bit_width=5, ctrl_bit=1) (clk, rst, read_data, read_weigth, load_n_op, load_base_addr, acc_addr_en, acc_op_en, init_n_operations, init_base_addr, stall_word, feedback_sel, output_data_reuse, mult_in_data, mult_in_weigth, end_conv_layer); 

input clk, rst;
input read_data, read_weigth;
input load_n_op, load_base_addr;
input acc_addr_en, acc_op_en;
input [max_n_operations-1:0] init_n_operations;
input [log_rom_size-1:0] init_base_addr;
input [2**log_n_mul-1:0] stall_word;
input [2**log_n_mul-1:0] feedback_sel; 
input [2**(log_n_mul)*(2**(log_bit_width))-1:0] output_data_reuse;
output [2**(log_n_mul)*(2**(log_bit_width)+ctrl_bit)-1:0] mult_in_data;
output [2**(log_n_mul)*(2**(log_bit_width)+ctrl_bit)-1:0] mult_in_weigth;
output end_conv_layer;

//Contiene memoria infinita, registri, mux per l'output, ones_counter;
wire clk_acc_op, clk_acc_addr;
wire [log_rom_size-1:0] data_rom_addr_in;
wire [log_rom_size-1:0] rom_addr_data;
wire [log_rom_size-1:0] rom_addr_weigth;
wire [2**(log_n_mul)*(2**(log_bit_width)+ctrl_bit)-1:0] rom_out_data;
wire [2**(log_n_mul)*(2**(log_bit_width)+ctrl_bit)-1:0] rom_out_weigth;
wire [2**(log_bit_width)+ctrl_bit-1:0] mux_data_out [2**(log_n_mul)-1:0];
wire [2**(log_bit_width)+ctrl_bit-1:0]feedback_in[2**(log_n_mul)-1:0];
wire [log_n_mul:0] n_mult;
wire [log_n_mul:0] n_stall;
wire [log_n_mul:0] n_avail_ops;
wire minus_sign, plus_sign;
//integer n_stall;

wire [max_n_operations-1:0]acc_rem_op_in;
wire [max_n_operations-1:0]rem_ops;

reg end_conv_layer;
//reg [2**log_n_mul-1:0] stall_word_reg;
genvar i;
assign minus_sign = 1'b1;
assign plus_sign = 1'b0;
//PLACE HERE A SUBTRACTOR
//DECIDE HOW MANY NEW WORDS WILL BE 
//PROCESSED NEXT C.C.
//N_DATA_OUT=N_MUL-N_STALL
assign n_mult = 2**log_n_mul;

assign n_avail_ops=((n_mult-n_stall)<rem_ops)? n_mult-n_stall : rem_ops;

always @(posedge clk)begin
if (rem_ops == {max_n_operations{1'b0}}) begin
	end_conv_layer <= 1'b1;
end
else begin 
	end_conv_layer <= 1'b0;
end
end

assign acc_rem_op_in = load_n_op ? init_n_operations : {{(max_n_operations-(log_n_mul+1)){1'b0}},{n_avail_ops}};
//This accumulator holds the remaining number of operation
//to be performed inside this conv_layer
assign clk_acc_op = clk & acc_op_en;
accumulator #(
  .bit_width(max_n_operations)
) remaining_operations (
  .clk(clk_acc_op),
  .rst(rst),
  .init(load_n_op),
  .sign(minus_sign),
  .in(acc_rem_op_in),
  .out(rem_ops)
);

assign clk_acc_addr = clk & acc_addr_en;
//This accumulator holds the address for rom
assign data_rom_addr_in = load_base_addr ? init_base_addr : {{(log_rom_size-(log_n_mul+1)){1'b0}},{n_avail_ops}};
accumulator #(
  .bit_width(log_rom_size)
) data_rom_addr (
  .clk(clk_acc_addr),
  .rst(rst),
  .init(load_base_addr),
  .sign(plus_sign),
  .in(data_rom_addr_in),
  .out(rom_addr_data)
);

custom_rom #(
  .rom_init(rom_data_init), 
  .log_bit_width(log_bit_width),
  .ctrl_bit(ctrl_bit),
  .log_rom_size(log_rom_size),
  .log_out_ports(log_n_mul)
)
my_data_rom (
  .clk(clk),
  .read(read_data),
  .stall_word(stall_word),
  .n_v_out(n_avail_ops),
  .addr(rom_addr_data),
  .data_out(rom_out_data)
);

custom_rom #(
  .rom_init(rom_weigth_init),
  .log_bit_width(log_bit_width),
  .ctrl_bit(ctrl_bit),
  .log_rom_size(log_rom_size),
  .log_out_ports(log_n_mul)
)
my_weigth_rom (
  .clk(clk),
  .read(read_weigth),
  .stall_word(stall_word),
  .n_v_out(n_avail_ops),
  .addr(rom_addr_data),
  .data_out(rom_out_weigth)
);

//PLACE A ACCUMULATOR WITH SUBTRACTOR:
//INIT WITH NUMBER OF PRODUCTS
//DECREMENT WITH NUMBER OF NOT STALLING MULT
//RISE A SIGNAL WHEN PRODUCTS ARE OVER

ones_counter
  #(.log_bit_width(log_n_mul))
stall_counter (
  .word_in(stall_word),
  .count_out(n_stall)
);

//always @(posedge clk) begin
//	if (rst==1'b1) begin
//		stall_word_reg <= {2**log_n_mul{1'b0}};
//	end
//	else begin
//		stall_word_reg <= stall_word;
//	end
//end

generate
for (i=0; i<2**log_n_mul; i=i+1) begin
assign feedback_in[i] = {{1'b1},{output_data_reuse[i*(2**(log_bit_width) +ctrl_bit) +: 2**log_bit_width]}};
  mux21_generic
	#(.bit_width(2**log_bit_width+ctrl_bit))
  mux_feedback_sel (
	//.a(rom_out_data[2**(log_n_mul)-i*(2**(log_bit_width)+ctrl_bit)-1 -: 2**log_bit_width+ctrl_bit]),
	//.b(output_data_reuse[2**(log_n_mul)-i*(2**(log_bit_width)+ctrl_bit)-1 -: 2**log_bit_width+ctrl_bit]),
	.a(rom_out_data[i*(2**(log_bit_width)+ctrl_bit)+:2**(log_bit_width)+ctrl_bit]),
	.b(feedback_in[i]),
	.s(feedback_sel[i]),
	.y(mux_data_out[i])
  );

  reg_gen 
	#(.bit_width(2**log_bit_width+ctrl_bit))
  reg_mult_in_data (
	.clk(clk),
	.rst(rst),
	.data_in(mux_data_out[i][2**log_bit_width+ctrl_bit-1:0]),
	.data_out(mult_in_data[i*(2**(log_bit_width)+ctrl_bit) +: 2**(log_bit_width)+ctrl_bit])
  ); 

  reg_gen 
	#(.bit_width(2**log_bit_width+ctrl_bit))
  reg_mult_in_weigth (
	.clk(clk),
	.rst(rst),
	.data_in(rom_out_weigth[i*(2**(log_bit_width)+ctrl_bit) +: 2**(log_bit_width)+ctrl_bit]),
	.data_out(mult_in_weigth[i*(2**(log_bit_width)+ctrl_bit) +: 2**(log_bit_width)+ctrl_bit])
  ); 
end
endgenerate

endmodule
