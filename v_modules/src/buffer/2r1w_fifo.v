module buffer # (parameter bit_width = 16,  addr_len = 3) (clk_r, clk_w, rst, consume, load, empty, full, data_in, data_out);
input clk_r, clk_w, rst,  consume, load;
output empty, full;
input [bit_width-1:0] data_in;
output [bit_width-1:0] data_out;

reg empty_v, full_v;
reg [bit_width-1:0] data_out_v;

reg [bit_width-1:0] buff[2**addr_len-1:0];
reg [addr_len-1:0] load_addr, consume_addr, next_load_addr, next_consume_addr;
//TODO: without n_residual
reg [addr_len-1:0] n_residual, next_n_residual;
reg already_read, next_already_read;
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
	  data_out_v <= {(bit_width+1){1'b0}};
	  next_load_addr <= {addr_len{1'b0}};
	  next_consume_addr <= {addr_len{1'b0}};
	  next_n_residual <= {addr_len{1'b0}};
	  wr_en <= 1'b0;
	  next_already_read <= 1'b0;
	end  
	RDY:
	begin
	  empty_v <= 1'b0;
	  full_v <= 1'b0;
	  next_already_read <= 1'b0;
	if (clk_w == 1'b1) begin
	  if (consume==1'b1 & load==1'b0) begin
		if (n_residual=={addr_len{1'b0}}) begin
		  data_out_v <={1'b1, buff[consume_addr]};
		  next_consume_addr <= consume_addr + 1; 
		  next_load_addr <= load_addr;
		  next_n_residual <= n_residual;
		  next_state <= EMPTY;
		end
		else begin
		  data_out_v <= {1'b1, buff[consume_addr]};
		  next_consume_addr <= consume_addr + 1;
		  next_load_addr <= load_addr;
		  next_n_residual <= n_residual - 1;
		  next_state <= RDY;	
		  end
		wr_en <= 1'b0;
	  	end

	  else if (consume==1'b1 & load==1'b1) begin
		data_out_v <= {1'b1, buff[consume_addr]};
		wr_en<=1'b1;
		next_consume_addr <= consume_addr + 1;
		next_load_addr <= load_addr + 1;
		next_n_residual <= n_residual;
		next_state <= RDY;
		end

	  else if (consume==1'b0 & load==1'b0) begin
		next_state <= RDY;
		wr_en <= 1'b0;
		//data_out_v <= {1'b0, {(addr_len){1'bz}}};
		//_^_ replaced high z with non valid word
		data_out_v[bit_width-1] <= 1'b0;
		next_consume_addr <= consume_addr;
		next_load_addr <= load_addr;
		next_n_residual <= n_residual;
		end
	  else if (consume==1'b0 & load==1'b1) begin
		if (n_residual=={addr_len{1'b1}}) begin
		  next_state <= FULL;
		  //buff[load_addr] <= data_in;
		  wr_en <= 1'b1;
		  next_consume_addr <= consume_addr;
		  next_load_addr <= load_addr + 1;
		  next_n_residual <= n_residual;
   		  end
		else begin  
		  next_state <= RDY;
		  wr_en <= 1'b1;
		  next_consume_addr <= consume_addr;
		  next_load_addr <= load_addr + 1;
		  next_n_residual <= n_residual + 1;
		  end
		//data_out_v <= {1'b0, {addr_len{1'bz}}};
		//_^_ replaced high z with non valid word
		data_out_v[bit_width-1] <= 1'b0;
		end
	end
	else if (clk_w == 1'b0 && clk_r == 1'b1) begin
	  if (consume==1'b1) begin
		if (n_residual=={addr_len{1'b0}}) begin
		  data_out_v <= {1'b1, {buff[consume_addr]}};
		  next_consume_addr <= consume_addr + 1; 
		  next_load_addr <= load_addr;
		  next_n_residual <= n_residual;
		  next_state <= EMPTY;
		end
		else begin
		  data_out_v <= {1'b1, {buff[consume_addr]}};
		  next_consume_addr <= consume_addr + 1;
		  next_load_addr <= load_addr;
		  next_n_residual <= n_residual - 1;
		  next_state <= RDY;	
		  end
		wr_en <= 1'b0;
	  	end

	  else if (consume==1'b0) begin
		next_state <= RDY;
		wr_en <= 1'b0;
		data_out_v <= {{1'b0}, {buff[consume_addr]}};
		next_consume_addr <= consume_addr;
		next_load_addr <= load_addr;
		next_n_residual <= n_residual;
	  end
	end
	end
	EMPTY:
	begin
if (clk_w == 1'b1) begin
	//already_read <= 1'b0;
	if (load==1'b1) begin
	empty_v <= 1'b0;
	  if (consume ==1'b0) begin
//		empty_v <= 1'b0;
		next_state <= RDY;
		wr_en <= 1'b1;
		next_consume_addr <= consume_addr;
		next_load_addr <= load_addr + 1;
		next_n_residual <= n_residual;
		//data_out_v <= {1'b0, {addr_len{1'bz}}};
		//_^_ replaced high z with non valid word
		data_out_v[bit_width-1] <= 1'b0;
		next_already_read <= 1'b0;
	  end
	  else begin
//		empty_v <= 1'b1;
		next_consume_addr <= consume_addr;
		next_load_addr <= load_addr;
		next_state <= EMPTY;
		data_out_v <= {1'b1, {data_in}};
		next_already_read <= 1'b1;
		wr_en <= 1'b0;
	  end	
	end
	else begin	 
		empty_v <= 1'b1;
		wr_en <= 1'b0;
		//data_out_v <= {1'b0, {addr_len{1'bz}}};
		//_^_ replaced high z with non valid word
		data_out_v[bit_width-1] <= 1'b0;
		next_consume_addr <= consume_addr;
		next_load_addr <= load_addr;
		next_n_residual <= n_residual;
		next_state <= EMPTY;
	  end
	end
else if (clk_w ==1'b0 && clk_r == 1'b1) begin
	if (load==1'b1 && consume == 1'b1) begin
  	  empty_v <= 1'b0;
//	  empty_v <= 1'b1;
	  next_consume_addr <= consume_addr;
	  next_load_addr <= load_addr;
	  next_state <= EMPTY;
	  if (already_read == 1'b0) begin
     	    data_out_v <= {1'b1,data_in};
	    next_already_read <= 1'b1;
	  end
	  else if (already_read == 1'b1) begin
	    //data_out_v <= {addr_len{1'bz}};
	    data_out_v <= {1'b0,data_in};
	    next_already_read <= 1'b0;
	  end
	  wr_en <= 1'b0;
	end	
	else if (load == 1'b0 && consume == 1'b1)  begin
	  empty_v <= 1'b1;
	  wr_en <= 1'b0;
	  //data_out_v <= {1'b0, {addr_len{1'bz}}};
	  //_^_ replaced high z with non valid word
	  data_out_v[bit_width-1] <= 1'b0;
  	  next_consume_addr <= consume_addr;
	  next_load_addr <= load_addr;
	  next_n_residual <= n_residual;
	  next_state <= EMPTY;
	  end
end
end
	FULL:
	begin
if (clk_w == 1'b1) begin
	full_v <= 1'b1;
	if (consume==1'b1) begin
	  if (load==1'b0) begin
		next_consume_addr <= consume_addr + 1;
		next_load_addr <= load_addr;
		next_n_residual <= n_residual - 1; 
		data_out_v <= {1'b1,buff[consume_addr]};
		next_state <= RDY;
		wr_en <= 1'b0;
		end
	  else begin
		next_consume_addr <= consume_addr + 1;
		next_load_addr <=load_addr + 1;
		next_n_residual <= n_residual;
		data_out_v <= {1'b1, buff[consume_addr]};
		wr_en <= 1'b1;
		next_state <= FULL;
		end
	end
	else begin
	//data_out_v <= {1'b0, {bit_width{1'bz}}};
	//_^_ replaced high z with non valid word
	data_out_v[bit_width-1] <= 1'b0;
	end
	end
else if (clk_w == 1'b0 && clk_r == 1'b1) begin
	full_v <= 1'b1;
	if (consume==1'b1) begin
	  next_consume_addr <= consume_addr + 1;
	  next_load_addr <= load_addr;
	  next_n_residual <= n_residual - 1; 
	  data_out_v <= {1'b1, buff[consume_addr]};
	  next_state <= RDY;
	  wr_en <= 1'b0;
	end
	else begin
	//data_out_v <= {1'b0, {bit_width{1'bz}}};
	//_^_ replaced high z with non valid word
	data_out_v[bit_width-1] <= 1'b0;
	end
	end
end
	endcase
  end
end

always @ (posedge clk_w or posedge clk_r)
begin
if (clk_w == 1'b1) begin
  load_addr <= next_load_addr;
  curr_state <= next_state;
  if (wr_en == 1'b1) begin
	buff[load_addr] <= data_in;
  end
end 
if (clk_r ==1'b1) begin 
  consume_addr <= next_consume_addr;
  already_read <= next_already_read;
end
  n_residual <= next_n_residual;
end

//always @ (posedge clk_r)
//begin
//  //data_out_reg <= data_out_v;
//end

  assign data_out = data_out_v;
  //assign data_out = data_out_reg;
  assign empty = empty_v;
  assign full = full_v;
endmodule
