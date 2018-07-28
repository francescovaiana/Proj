module reg_ie_gen #(parameter bit_width=16) (clk, rst, data_in, enable, data_out);

input clk, rst, enable;
input [bit_width-1:0] data_in;
output [bit_width-1:0] data_out;

reg [bit_width-1:0] data_out;

always @(posedge clk) begin
if (rst==1'b1) begin
  data_out <= {bit_width{1'b0}};
end
else begin
	if (enable==1'b1) begin
	  data_out <= data_in;
	end
end
end
endmodule	
