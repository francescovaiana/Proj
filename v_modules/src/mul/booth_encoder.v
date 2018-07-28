module booth_encoder #(parameter bit_width=16) (b, o_2, o_1, o_0);
input [bit_width:0] b;
output [bit_width/2-1:0] o_2;
output [bit_width/2-1:0] o_1;
output [bit_width/2-1:0] o_0;
//[bit_width/2-1:0];

genvar i;
//wire [2:0] o_temp[bit_width/2-1];

//assign o_temp = {o_2, o_1, o_0};
for(i=0; i<bit_width/2-1; i=i+1) begin
  encoder en(
  .b(b[2*i:2*i+1]),
  //.b[2](b[2*i]),
  //.b[1](b[2*i+1]),
  //.b[0](b[2*i+2]),
  .o({o_2[i],o_1[i],o_0[i]})
);
end 
endmodule
