module rotate_reg #(parameter bit_width = 16) (clk, rst, ld, sh, data_in, data_out);
input clk;
input rst;
input ld;
input sh;
input [bit_width-1:0] data_in;
output [bit_width-1:0] data_out;

reg [bit_width-1:0] data_out_v, data_out_reg;
always @(*) begin
if (ld == 1'b1 && sh == 1'b1) begin
	data_out_v <= {data_in[0],data_in[bit_width-1:1]};
end
else if (ld == 1'b1 && sh == 1'b0) begin
	data_out_v <= data_in;
end
else if (ld == 1'b0 && sh == 1'b1) begin
	data_out_v <= {data_out_reg[0],data_out_reg[bit_width-1:1]};
end
else if (ld == 1'b0 && sh == 1'b0) begin
	data_out_v <= data_out_reg;
end
end

always @(posedge clk) begin
if (rst == 1'b1) begin
	data_out_reg <= {bit_width{1'b0}};
end
else begin
	data_out_reg <= data_out_v;
end
end
assign data_out = data_out_reg;

endmodule

	

