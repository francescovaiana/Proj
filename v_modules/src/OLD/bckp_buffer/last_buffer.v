module buffer # (parameter bit_width = 16,  addr_len = 3) (clk, rst, consume, load, empty, full, data_in, data_out);
input clk, rst,  consume, load;
output empty, full;
input [bit_width-1:0] data_in;
output [bit_width-1:0] data_out;

reg empty_v, full_v;
reg [bit_width-1:0] data_out_v, next_data_out;

reg [bit_width-1:0] buff[2**addr_len-1:0];
reg [addr_len-1:0] load_addr, consume_addr, next_load_addr, next_consume_addr;
//TODO: without n_residual
reg [addr_len-1:0] n_residual, next_n_residual;

reg wr_en;
parameter RST=2'b00, RDY=2'b01, EMPTY=2'b10, FULL=2'b11;
reg [1:0] curr_state, next_state;
//never happen that consume arrives when empty is true

always @ (*)
begin
  if (rst) begin 
	next_state <= RST;
	end
  else begin
	case (curr_state)
	RST: 
	begin
	  next_state <= EMPTY;
	  empty_v <= 1'b1;
	  full_v <= 1'b0;
	  data_out_v <= {bit_width{1'bz}};
	  next_load_addr <= {addr_len{1'b0}};
	  next_consume_addr <= {addr_len{1'b0}};
	  n_residual <= {addr_len{1'b0}};
	  next_n_residual <= {addr_len{1'b0}};
	  wr_en <= 1'b0;
	end  
	RDY:
	begin
	  empty_v <= 1'b0;
	  full_v <= 1'b0;
	  if (consume==1'b1 & load==1'b0) begin
		if (n_residual=={addr_len{1'b0}}) begin
		  data_out_v <= buff[consume_addr];
		  next_consume_addr <= consume_addr + 1; 
		  next_state <= EMPTY;
		end
		else begin
		  data_out_v <= buff[consume_addr];
		  next_consume_addr <= consume_addr + 1;
		  next_n_residual <= n_residual - 1;
		  next_state <= RDY;	
		  end
		wr_en <= 1'b0;
	  	end

	  else if (consume==1'b1 & load==1'b1) begin
		data_out_v <= buff[consume_addr];
		wr_en<=1'b1;
		next_consume_addr <= consume_addr + 1;
		next_load_addr <= load_addr + 1;
		next_state <= RDY;
		end

	  else if (consume==1'b0 & load==1'b0) begin
		next_state <= RDY;
		wr_en <= 1'b0;
		data_out_v <= {addr_len{1'bz}};
		end
	  else if (consume==1'b0 & load==1'b1) begin
		if (n_residual=={addr_len{1'b1}}) begin
		  next_state <= FULL;
		  //buff[load_addr] <= data_in;
		  wr_en <= 1'b1;
		  next_load_addr <= load_addr + 1;
   		  end
		else begin  
		  next_state <= RDY;
		  wr_en <= 1'b1;
		  next_load_addr <= load_addr + 1;
		  next_n_residual <= n_residual + 1;
		  end
		data_out_v <= {addr_len{1'bz}};
		end
	end
	EMPTY:
	begin
	if (load==1'b1) begin
	empty_v <= 1'b0;
	  if (consume ==1'b0) begin
		next_state <= RDY;
		wr_en <= 1'b1;
		next_load_addr <= load_addr + 1;
	  end
	  else begin
		next_load_addr <= load_addr;
		next_state <= EMPTY;
		data_out_v <= data_in;
		wr_en <= 1'b0;
	  end	
	end
	else begin	 
		empty_v <= 1'b1;
		wr_en <= 1'b0;
		data_out_v <= {addr_len{1'bz}};
		next_load_addr <= load_addr;
		next_state <= EMPTY;
		end
	end
	FULL:
	begin
	full_v <= 1'b1;
	if (consume==1'b1) begin
	  if (load==1'b0) begin
		next_consume_addr <= consume_addr + 1;
		next_n_residual <= n_residual - 1; 
		data_out_v <= buff[consume_addr];
		next_state <= RDY;
		wr_en <= 1'b0;
		end
	  else begin
		next_consume_addr <= consume_addr + 1;
		next_load_addr <=load_addr + 1;
		data_out_v <= buff[consume_addr];
		wr_en <= 1'b1;
		next_state <= FULL;
		end
	end
	else begin
	data_out_v <= {bit_width{1'bz}};
	end
	end
	endcase
  end
end

always @ (posedge clk)
begin
  curr_state <= next_state;
  load_addr <= next_load_addr;
  consume_addr <= next_consume_addr;
  n_residual <= next_n_residual;
  if (wr_en == 1'b1) begin
	buff[load_addr] <= data_in;
  end
end

  assign data_out = data_out_v;
  assign empty = empty_v;
  assign full = full_v;
endmodule
