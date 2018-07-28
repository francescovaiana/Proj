module rca # (parameter bit_width=16) (a, b, carry_in, s, carry_out);
input [bit_width-1:0] a, b;
input carry_in;
output [bit_width-1:0] s;
output carry_out;

wire [bit_width-1:0]s_temp, b_temp;
wire [bit_width:0] c_temp;
genvar i;

assign c_temp[0] = carry_in;
assign s = s_temp;
assign carry_out = c_temp[bit_width];

generate
for (i=1; i<bit_width+1; i=i+1)begin
assign b_temp[i-1] = b[i-1]^carry_in;
  
  full_adder fa(
    .a(a[i-1]),
    .b(b_temp[i-1]),
    .Ci(c_temp[i-1]),
    .s(s_temp[i-1]),
    .Co(c_temp[i])
  );
  end
endgenerate

endmodule
