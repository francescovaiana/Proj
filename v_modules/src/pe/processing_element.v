module processing_element #(parameter max_n_operations=16, log_rom_size=16, ctrl_bit=1, log_bit_width=3, log_n_mul=2, log_n_add=2) (clk, rst, read_data, read_weigth, load_n_op, load_base_addr, load_bias, acc_addr_en, acc_op_en, init_n_operations, init_base_addr, feedback_sel, bias_in, end_conv_layer, output_reuse);
input [log_n_mul/2:0] clk;
input rst;
input read_data, read_weigth;
input load_n_op, load_base_addr, load_bias;
input acc_addr_en, acc_op_en;
input [max_n_operations-1:0] init_n_operations;
input [log_rom_size-1:0] init_base_addr;
input [2**log_n_mul-1:0] feedback_sel;
input [2**(log_n_add)*2**(log_bit_width)-1:0] bias_in;
output [(2**log_n_add)*(2**(log_bit_width+1))-1:0] output_reuse;
output end_conv_layer;

wire [2**log_n_mul-1:0] stall_word;
genvar i;
//ALL ARRAYS WITHOUT CTRL_BIT FOR READABILITY
wire [(2**log_n_mul)*(2**(log_bit_width)+ctrl_bit)-1:0] mult_in_data;
wire [2**(log_bit_width)-1:0] mult_in_data_arr [2**log_n_mul-1:0];
wire [(2**log_n_mul)*(2**(log_bit_width)+ctrl_bit)-1:0] mult_in_weigth;
wire [2**(log_bit_width)-1:0] mult_in_weigth_arr [2**log_n_mul-1:0];
wire [(2**log_n_mul)*(2**(log_bit_width+1)+ctrl_bit)-1:0] mult_out;
wire [2**(log_bit_width+1)-1:0] mult_out_arr [2**log_n_mul-1:0];
wire [ctrl_bit-1:0] val_bit_mul [2**log_n_mul-1:0];
wire [(2**log_n_mul)*(2**(log_bit_width+1)+log_n_add+ctrl_bit)-1:0] net_in;
wire [(2**(log_bit_width+1)+log_n_add)-1:0] net_in_arr [2**log_n_mul-1:0];
wire [(2**log_n_add)*(2**(log_bit_width+1))-1:0]net_out;
wire [(2**(log_bit_width+1))-1:0]net_out_arr [2**log_n_add-1:0];
wire [2**(log_bit_width+1)-1:0]acc_in_arr[2**log_n_add-1:0];
wire [(2**log_n_add)*(2**(log_bit_width+1))-1:0] output_reuse_i;
wire [(2**log_n_add)*(2**(log_bit_width))-1:0] output_reuse_i_hw;
wire [2**log_n_add-1:0] val_bit_acc;
//output [2**log_n_mul-1:0] stall_v;
wire plus_sign=1'b0;

for (i=0; i<2**log_n_mul; i=i+1) begin
  assign mult_in_data_arr[i] = mult_in_data[i*(2**(log_bit_width)+ctrl_bit)+:2**(log_bit_width)];
  assign mult_in_weigth_arr[i] = mult_in_weigth[i*(2**(log_bit_width)+ctrl_bit)+:2**(log_bit_width)];
  assign mult_out_arr[i] = mult_out[i*(2**(log_bit_width+1)+ctrl_bit)+:2**(log_bit_width+1)];
  assign net_in_arr[i] = net_in[i*(2**(log_bit_width+1)+log_n_add+ctrl_bit)+:2**(log_bit_width+1)+log_n_add];
end

for (i=0; i<2**log_n_add; i=i+1) begin
  assign output_reuse_i_hw[i*(2**log_bit_width)+:2**log_bit_width]=output_reuse_i[i*(2**(log_bit_width+1))+: 2**log_bit_width];
  assign net_out_arr[i] = net_out[i*(2**(log_bit_width+1))+:2**(log_bit_width+1)];
end

dispatcher #(
  .rom_data_init("./dispatcher/data.mem"),
  .rom_weigth_init("./dispatcher/weigth.mem"), 
  .max_n_operations(max_n_operations), 
  .log_rom_size(log_rom_size),
  .log_n_mul(log_n_mul),
  .log_n_add(log_n_add),
  .log_bit_width(log_bit_width),
  .ctrl_bit(ctrl_bit)
) my_dispatcher(
  .clk(clk[0]),
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
  .output_data_reuse(output_reuse_i_hw),
  .mult_in_data(mult_in_data),
  .mult_in_weigth(mult_in_weigth),
  .end_conv_layer(end_conv_layer)
);

generate
for (i=0; i<2**log_n_mul; i=i+1) begin
  mul #(
	.bit_width(2**(log_bit_width))) 
  multiplier_v (
	.a(mult_in_data[i*(2**log_bit_width+ctrl_bit) +: 2**log_bit_width]),
	.b(mult_in_weigth[i*(2**log_bit_width+ctrl_bit) +: 2**log_bit_width]),
	.o(mult_out[i*(2**(log_bit_width+1)+ctrl_bit) +: 2**(log_bit_width+1)])
);
//	assign mult_out[i*(2**(log_bit_width+1)+ctrl_bit)+2**log_bit_width-1+ctrl_bit +: ctrl_bit] = mult_in_data[i*(2**log_bit_width+ctrl_bit)+2**log_bit_width-1+ctrl_bit+:ctrl_bit] & mult_in_weigth[i*(2**log_bit_width+ctrl_bit)+2**log_bit_width-1+ctrl_bit+:ctrl_bit];
	
assign val_bit_mul[i] = mult_in_data[i*(2**log_bit_width+ctrl_bit)+2**log_bit_width-1+ctrl_bit+:ctrl_bit] & mult_in_weigth[i*(2**log_bit_width+ctrl_bit)+2**log_bit_width-1+ctrl_bit+:ctrl_bit];
assign net_in[i*(2**(log_bit_width+1)+log_n_add+ctrl_bit)+:2**(log_bit_width+1)+log_n_add+ctrl_bit] = {{val_bit_mul[i]}, {log_n_add{1'b1}}, {mult_out[i*(2**(log_bit_width+1)+ctrl_bit) +: 2**(log_bit_width+1)]}};
end
endgenerate

my_noc #(
  .bit_width(2**(log_bit_width+1)),
  .log_n_mul(log_n_mul),
  .log_n_add(log_n_add),
  .ctrl_bit(ctrl_bit))
link_network (
  .clk(clk),
  .rst(rst),
  .in(net_in),
  .out(net_out),
  .val_bit(val_bit_acc),
  .stall(stall_word)
);

generate
for (i=0; i < 2**log_n_add; i=i+1) begin
  assign acc_in_arr[i] = (load_bias==1'b1)?{{(2**log_bit_width){1'b0}},{bias_in[i*(2**log_bit_width) +: 2**log_bit_width]}}:(val_bit_acc[i]==1'b1)?net_out[i*(2**(log_bit_width+1)) +:2**(log_bit_width+1)]: {2**(log_bit_width+1){1'b0}};
  //assign acc_in[i] = load_bias?inet_out[i*(2**log_bit_width+1) +:2**(log_bit_width+1)]:{{(2**log_bit_width){1'b0}},{bias_in[i*(2**log_bit_width) +: 2**log_bit_width]}}
  //TODO: Non è più vero Ho allargato di un bit la dimensione per il test.
  accumulator #(
	.bit_width(2**(log_bit_width+1))) 
  accumulator_n (
	.clk(clk[log_n_mul/2]),
	.rst(rst),
	.init(load_bias),
	.sign(plus_sign),
	.in(acc_in_arr[i]),
	.out(output_reuse_i[i*(2**(log_bit_width+1)) +: 2**(log_bit_width+1)])
);
end
endgenerate

assign output_reuse = output_reuse_i;

endmodule
