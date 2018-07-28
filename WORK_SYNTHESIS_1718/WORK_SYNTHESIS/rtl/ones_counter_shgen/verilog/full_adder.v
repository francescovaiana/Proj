module full_adder (a, b, Ci, s, Co);
input a, b, Ci;
output s, Co;

assign s = a^b^Ci;
assign Co = (a&b)|(b&Ci)|(a&Ci);

endmodule
