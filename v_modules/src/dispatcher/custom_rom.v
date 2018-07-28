module custom_rom #(parameter rom_init="rom.mem", log_bit_width=5, ctrl_bit=1, log_rom_size=5, log_out_ports=3) (clk, read, stall_word, addr, n_v_out, data_out);


input clk, read;
input [2**log_out_ports-1:0] stall_word;
input [log_out_ports:0] n_v_out;
input [log_rom_size-1:0] addr;
output [2**(log_out_ports)*(2**(log_bit_width)+ctrl_bit)-1:0] data_out;

reg [2**log_bit_width-1:0] mem_array [2**log_rom_size-1:0];
reg [(2**(log_out_ports))*(2**(log_bit_width)+ctrl_bit)-1:0] s_data_out;
reg [2**(log_out_ports)*(2**(log_bit_width)+ctrl_bit)-1:0] data_out;

initial begin
  $display("Loading rom.");
  $readmemb(rom_init, mem_array);
end

//Primo bit messo a zero per invalidare
always @(addr, stall_word, n_v_out) begin:rom_process
integer count_v, i;
count_v=0;
for (i=0; i<2**log_out_ports; i=i+1) begin
  if (stall_word[i]==1'b0 && count_v < n_v_out) begin
	s_data_out[i*(2**(log_bit_width)+ctrl_bit)+:2**log_bit_width] <= mem_array[addr+count_v];
	s_data_out[(i+1)*(2**(log_bit_width)+ctrl_bit)-1] <= {ctrl_bit{1'b1}};
	count_v=count_v+1;
  end
  else begin
	s_data_out[(i+1)*(2**(log_bit_width)+ctrl_bit)-1] <= {ctrl_bit{1'b0}};
  end
end
end


always @(posedge clk) begin
  if (read==1'b1) begin
  	data_out <= s_data_out;
  end
//  else begin
//	data_out <={2**(log_bit_width+log_out_ports)-1{1'bz}};
//  end
end




endmodule
