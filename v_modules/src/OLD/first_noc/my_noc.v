module my_noc # (parameter bit_width=16, log_n_mul=6, log_n_add=6, ctrl_bit=1) (clk, rst, in, out, stall);
input [log_n_mul/2:0] clk;
input rst;
input  [(bit_width+log_n_add+ctrl_bit)*(2**log_n_mul)-1:0] in;
//output [bit_width*(2**log_n_add)-1:0] out;
output [bit_width+log_n_add+ctrl_bit-1:0] out;
output [2**log_n_mul-1:0] stall;

wire [bit_width+log_n_add+ctrl_bit-1:0] in_mat[2**log_n_mul-1:0];
wire [bit_width-1:0] out_mat[2**log_n_add-1:0];


wire [bit_width+log_n_add+ctrl_bit-1:0] enh_mux_mat[log_n_mul-1:0][2**(log_n_mul-1)-1:0];
//wire enh_mux_full[log_n_mul-1:0][2**log_n_mul-1:0];
wire enh_mux_busy[log_n_mul-1:0][2**(log_n_mul-1)-1:0];


//BUFFER LENGTH
  parameter log_buff_len = 3;
//
genvar i, j;
for (i=0; i < 2**log_n_mul; i=i+1) begin
	assign in_mat[i] = in[i*(bit_width+log_n_add+ctrl_bit) +: (bit_width+log_n_add+ctrl_bit)];
end

for (i=0; i < 2**log_n_add; i=i+1) begin
	assign out[i*bit_width +: bit_width] = out_mat[i];
end

generate
for (i=0; i < log_n_mul; i=i+1) begin
  for(j=0; j < 2**(log_n_mul-i-1); j=j+1) begin
	if(i==0) begin
	  //assign enh_mux_mat[i][j+:2] = in_mat[j+:2];
	  //assign enh_mux_full[i][j+:2] = stall[i][j+:2];
	  enh_mux # (
	    .word_width(bit_width+log_n_add+ctrl_bit), 
	    .val_bit(ctrl_bit),
	    .log_buffer_len(3)
	  )
//the read clock might be faster
//the write clock is referred to the level
	  dist_arbiter (
	    .clk_r(clk[0]),
	    .clk_w(clk[0]),
	    .rst(rst),
	    .busy(enh_mux_busy[i][j]),
	    .in_1(in_mat[2*j]),
	    .in_2(in_mat[2*j+1]),
	    .out(enh_mux_mat[i][j]),
	    .full_1(stall[2*j]),
	    .full_2(stall[2*j+1])	
	  );
	end 
  	else begin
	  enh_mux # (
	    .word_width(bit_width+log_n_add+ctrl_bit), 
	    .val_bit(ctrl_bit),
	    .log_buffer_len(log_buff_len)
	  )
	  dist_arbiter (
	    //.clk_r(clk[(i-1)/2]),
	    //.clk_w(clk[i/2]),
	    .clk_r(clk[(i+1)/2]),
	    .clk_w(clk[i/2]),
	    //.clk_r(clk[0]),
	    //.clk_w(clk[0]),
	    .rst(rst),
	    .busy(enh_mux_busy[i][j*(2**(i))]),
	    .in_1(enh_mux_mat[i-1][j*(2**(i))]),
	    .in_2(enh_mux_mat[i-1][j*(2**(i))+(2**(i-1))]),
	    .out(enh_mux_mat[i][j*(2**(i))]),
	    .full_1(enh_mux_busy[i-1][j*(2**(i))]),
	    .full_2(enh_mux_busy[i-1][j*(2**(i))+(2**(i-1))])	
	  );
  	end
  end
end
endgenerate
assign enh_mux_busy[log_n_mul-1][0]=1'b0;
endmodule
