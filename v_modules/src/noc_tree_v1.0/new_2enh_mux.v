module enh_mux # (parameter word_width=16, val_bit=1, log_buffer_len=3) (clk_r, clk_w, rst, busy,  in_1, in_2, out, full_1, full_2);
//clk_w is the slow one: goes to lower fifo
//clk_r is the speed one: relative to the tree level
input clk_r, clk_w, rst;
input busy;
input [word_width-1:0] in_1, in_2;
output [word_width-1:0]out;
output full_1, full_2;

wire [word_width-val_bit-1:0] fifo1_in, fifo2_in;
wire [word_width-1:0] fifo1_out, fifo2_out;

assign fifo1_in = in_1[word_width-val_bit-1:0];
assign fifo2_in = in_2[word_width-val_bit-1:0];
//arbiter
parameter LEFT = 2'b00, RIGHT = 2'b01, BUSY_STATE = 2'b10, BUSY_EXT = 2'b11;
reg [1:0] curr_state, next_state, previous_state;
reg fifo1_rd, fifo2_rd;
reg fifo1_rd_reg, fifo2_rd_reg;
wire fifo1_empty, fifo1_full, fifo2_empty, fifo2_full, read_1, read_2;
reg [word_width-1:0] curr_out, previous_out;

reg valid, previous_busy;

buffer #(.bit_width(word_width-val_bit), .addr_len(log_buffer_len))fifo1(
.clk_r(clk_r),
.clk_w(clk_w),
.rst(rst),
.consume(read_1),			// from the arbiter
.load(in_1[word_width-1+:val_bit]), 	//or from validity bit
.empty(fifo1_empty),			//out to the arbiter
.full(fifo1_full),			//out to the arbiter
.data_in(fifo1_in), 			//to be partioned
.data_out(fifo1_out) 			//...
);

buffer #(.bit_width(word_width-val_bit), .addr_len(log_buffer_len))fifo2(
.clk_r(clk_r),
.clk_w(clk_w),
.rst(rst),
.consume(read_2),
.load(in_2[word_width-1 +: val_bit]),
.empty(fifo2_empty),
.full(fifo2_full),
.data_in(fifo2_in),
.data_out(fifo2_out)
);

always @ (*) begin

if (rst) begin
	fifo1_rd <= 1'b0;
	fifo2_rd <= 1'b0;
	valid <= 1'b0;
	next_state <= LEFT;
	curr_out[word_width-1:0] <= {word_width{1'b0}};
end
else begin
  if (curr_state==LEFT) begin
	if (fifo1_empty==1'b1 & fifo2_empty!=1'b1) begin

//PLACE HERE  NEXT_FIFO_RD
	  fifo2_rd <= 1'b1;
	  fifo1_rd <= 1'b0;  
	  valid <= 1'b1;
	  curr_out[word_width-1:0] <=fifo2_out; 
 	  if (busy == 1'b1) begin
	    next_state <= BUSY_STATE;
	  end
  	  else begin
	    next_state <= LEFT;
	  end
	end
	else if (fifo1_empty==1'b0) begin
	  fifo1_rd <= 1'b1;
	  fifo2_rd <= 1'b0;
	  valid <= 1'b1;
	  curr_out[word_width-1:0] <=fifo1_out;
 	  if (busy == 1'b1) begin
	    next_state <= BUSY_STATE;
	  end
  	  else begin
	    next_state <= RIGHT;
	  end
	end
	else if (fifo1_empty==1'b1 & fifo2_empty==1'b1) begin
//	  curr_out[word_width-1] <= 1'b0;
	  valid <= 1'b0;
	  fifo1_rd <= 1'b0;
	  fifo2_rd <= 1'b0;
 	  if (busy == 1'b1) begin
	    next_state <= BUSY_STATE;
	  end
  	  else begin
	    next_state <= LEFT;
	  end
	end
  end
  else if (curr_state==RIGHT) begin
	if (fifo2_empty==1'b1 & fifo1_empty!=1'b1) begin
	  fifo1_rd <= 1'b1;
	  fifo2_rd <= 1'b0;	  
	  valid <= 1'b1;
	  curr_out[word_width-1:0] <= fifo1_out; 
 	  if (busy == 1'b1) begin
	    next_state <= BUSY_STATE;
	  end
  	  else begin
	    next_state <= RIGHT;
	  end
	end
	else if (fifo2_empty==1'b0) begin
	  fifo2_rd <= 1'b1;
	  fifo1_rd <= 1'b0;
	  valid <= 1'b1;
	  curr_out[word_width-1:0] <= fifo2_out;
 	  if (busy == 1'b1) begin
	    next_state <= BUSY_STATE;
	  end
  	  else begin
	    next_state <= LEFT;
	  end
	end
	else if (fifo1_empty==1'b1 & fifo2_empty==1'b1) begin
//	  curr_out[word_width-1] = 1'b0;
	  valid <= 1'b0;
	  fifo1_rd <= 1'b0;
	  fifo2_rd <= 1'b0;
 	  if (busy == 1'b1) begin
	    next_state <= BUSY_STATE;
	  end
  	  else begin
	    next_state <= RIGHT;
	  end
	end
  end//Left Rigth
  else if (curr_state == BUSY_STATE) begin
	fifo1_rd <= 1'b0;
	fifo2_rd <= 1'b0;
	valid <= 1'b0;
	if (busy==1'b1) begin
	  next_state <= BUSY_STATE;
	end
	else begin
	  next_state <= BUSY_EXT;
	end
  end
  else if(curr_state == BUSY_EXT) begin
	valid <= 1'b1;
	next_state <= LEFT;
  end
end
end

always @ (posedge clk_r) begin
if (rst) begin
  curr_state<=1'b0;
end
else begin
  curr_state<=next_state;
end
end
//assign out[word_width-1 +: val_bit] = in_1[word_width-1 +: val_bit] | in_2[word_width-1 +: val_bit];
assign out[word_width-1] = valid & curr_out[word_width-1];
assign out[word_width-2:0] = curr_out[word_width-2:0];
assign full_1 = fifo1_full;
assign full_2 = fifo2_full;
//assign full_1 = fifo1_full | busy;
//assign full_2 = fifo2_full | busy;
//assign read_1 = fifo1_rd & (~busy);
//assign read_2 = fifo2_rd & (~busy);
assign read_1 = fifo1_rd;
assign read_2 = fifo2_rd;

endmodule
