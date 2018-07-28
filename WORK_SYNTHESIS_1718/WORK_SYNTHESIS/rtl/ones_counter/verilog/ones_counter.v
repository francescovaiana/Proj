module ones_counter #(parameter log_bit_width=5) (clk, rst, word_in, count_out);

input clk, rst;
input [2**log_bit_width-1 : 0] word_in;
output [log_bit_width : 0] count_out;

wire zero;
wire [2**log_bit_width-1:0]seq_in;
wire [log_bit_width : 0] seq_out;
wire [2**log_bit_width-1:0]mat_temp[log_bit_width:0][2**(log_bit_width)-1:0];
wire [2**log_bit_width-1:0] count_out_temp;
genvar i, j;

reg_gen 
  #(.bit_width(2**log_bit_width))
reg_in (
  .clk(clk),
  .rst(rst),
  .data_in(word_in),
  .data_out(seq_in)
);

reg_gen 
  #(.bit_width(log_bit_width+1))
reg_out (
  .clk(clk),
  .rst(rst),
  .data_in(seq_out),
  .data_out(count_out)
);

for (i=0; i < 2**log_bit_width; i=i+1) begin
	assign mat_temp[0][i]={{((2**log_bit_width)-1){1'b0}}, {seq_in[2**log_bit_width-i-1]}};
end

generate
for (i=0; i<log_bit_width; i=i+1) begin
  for (j=0; j<2**(log_bit_width-i-1); j=j+1) begin
	rca #(
	  .bit_width(2**log_bit_width)) 
	first_adder (
	  .a(mat_temp[i][(2**(i+1))*j]),
	  .b(mat_temp[i][(2**(i+1))*j+2**(i)]),
	  .carry_in(zero),
	  .s(mat_temp[i+1][(2**(i+1))*j])
	);
	//else begin
	//  rca #(
	//	.bit_width(2**log_bit_width)) 
	//  adders (
	//	.a(mat_temp[i-1][(2**i)*j]),
	//	.b(mat_temp[i-1][(2**i)*j+(2**(i-1))]),
	//	.carry_in(zero),
	//	.s(mat_temp[i][(2**i)*j])
	//	);
	//end
  end
end 
endgenerate

assign zero = 1'b0; 
assign count_out_temp = mat_temp[log_bit_width][0];
assign seq_out = count_out_temp[log_bit_width:0];
endmodule
