module buffer_ts(in, enable, out);
input in, enable;
output out;

assign out = enable?in:'bz;

endmodule 
