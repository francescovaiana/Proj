module binary_tree_noc # (parameter log_n_mult = 6, log_n_add = 6, bit_width = 16, val_bit = 1, log_buffer_len = 3)(n_in, n_out, clk_arr);

input [log_n_mult/2-1:0] clk_arr;
input [2**log_n_mult*(val_bit+log_n_add+bit_width)-1:0] n_in;
input [2**log_n_add*(val_bit+log_n_add+bit_width)-1:0] n_out;

wire [(val_bit+log_n_add+bit_width)-1:0] in_mult [2**log_n_mult-1:0];
wire [(val_bit+log_n_add+bit_width)-1:0] out_add [2**log_n_add-1:0];

wire [(val_bit+log_n_add+bit_width)-1:0] in_mtx [log_n_mult-1:0][2**log_n_mult-1:0];
genvar i, j;

for (i=0; i<2**log_n_mult; i=i+1) begin
	assign in_mult[i] = n_in[2**log_n_mult-i*bit_width-1 +:bit_width];
end

for (i=0; i<2**log_n_add; i=i+1) begin
	assign n_out[2**log_n_mult-i*bit_width-1 +:bit_width] = out_add[i];
end

for (i=0; i <log_n_mult-1; i=i+1) begin
  for (j=0; j<2**(log_n_mult-1); j=j+1) begin
	enh_mux #(.word_width(log_n_add+bit_width), .val_bit(val_bit), .log_buffer_len(log_buffer_len) arbiter (
	  .clk(),
	  .rst(),
	  .in_1(),
	  .in_2(),
	  .out(),
	  .full_1(),
	  .full_2()
	);
	
  end
end



endmodule
