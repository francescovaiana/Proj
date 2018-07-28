module ones_counter #(parameter log_bit_width=5) (word_in, count_out);

input [2**log_bit_width-1 : 0] word_in;
output [log_bit_width : 0] count_out;

wire zero;
wire [2**log_bit_width-1:0]mat_temp[log_bit_width:0][2**(log_bit_width)-1:0];
wire [2**log_bit_width-1:0] count_out_temp;
wire co;
genvar i, j;


for (i=0; i < 2**log_bit_width; i=i+1) begin
	assign mat_temp[0][i]={{((2**log_bit_width)-1){1'b0}}, {word_in[2**log_bit_width-i-1]}};
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
	  .carry_out(c_o),
	  .s(mat_temp[i+1][(2**(i+1))*j])
	);
  end
end 
endgenerate

assign zero = 1'b0; 
assign count_out = mat_temp[log_bit_width][0];
endmodule
