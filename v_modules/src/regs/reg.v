module reg_gen #(parameter bit_width=16) (clk, rst, data_in, data_out);

input clk, rst;
input [bit_width-1:0] data_in;
output [bit_width-1:0] data_out;

reg [bit_width-1:0] data_out;

always @(posedge clk) begin
if (rst==1'b1) begin
  data_out <= {bit_width{1'b0}};
end
else begin
  data_out <= data_in;
end
end
endmodule
