module tb_buffer();
reg clk, rst, wr, rd;
reg [15:0] data_in;
wire [15:0] data_out;
wire empty, full;
wire [1:0]n_residual;
buffer #(.addr_len(2), .bit_width(16)) DUT(
.clk(clk),
.rst(rst),
.load(wr),
.consume(rd),
.data_in(data_in),
.empty(empty),
.full(full),
.data_out(data_out)
);

initial begin
	clk = 1'b0;
	rst = 1'b1;
	repeat(4) #10 clk=~clk;
	rst = 1'b0;
	forever #10 clk=~clk;
end

initial begin
	data_in = 16'h0;
 	wr = 1'b1;
	rd = 1'b0;	
	@(negedge rst);
	data_in = 16'h0;
	@(posedge clk);
	data_in = 16'h1;
	@(posedge clk);
	data_in = 16'h2;
	@(posedge clk);
	data_in = 16'h3;
	@(posedge clk);
	data_in = 16'h4;
	@(posedge clk);
	data_in = 16'h5;
	@(posedge clk);
	rd = 1'b1;
	data_in = 16'h6;
	@(posedge clk);
	data_in = 16'h7;
	@(posedge clk);
	data_in = 16'h8;
	@(posedge clk);
	data_in = 16'h9;
	@(posedge clk);
	data_in = 16'hA;
	@(posedge clk);
	data_in = 16'hB;
	@(posedge clk);
	data_in = 16'hC;
	wr = 1'b0;
	@(posedge clk);
	data_in = 16'hD;
	@(posedge clk);
	data_in = 16'hE;
	@(posedge clk);
	data_in = 16'hF;
	@(posedge clk);
	rd = 1'b0;
	data_in = 16'h10;
	@(posedge clk);
	data_in = 16'h11;
	@(posedge clk);
	data_in = 16'h12;
	@(posedge clk);
	data_in = 16'h13;
	wr = 1'b1;
	rd = 1'b0;
	@(posedge clk); 
        data_in = 16'h14;
        @(posedge clk);
        data_in = 16'h15;
        @(posedge clk);
        data_in = 16'h16;
        @(posedge clk);
	wr = 1'b1;
        rd = 1'b1;
        data_in = 16'h17;
        @(posedge clk);
        data_in = 16'h18;
        @(posedge clk);
        data_in = 16'h18;
        @(posedge clk);
        data_in = 16'h9;
        @(posedge clk);
        data_in = 16'h1A;
        @(posedge clk);
        data_in = 16'h1B;
        @(posedge clk);
        data_in = 16'h1C;
        wr = 1'b0;
	rd = 1'b1;
        @(posedge clk);
        data_in = 16'h1D;
        @(posedge clk);
        data_in = 16'h11E;
        @(posedge clk);
        data_in = 16'h1F;
        @(posedge clk);
        rd = 1'b0;
	wr = 1'b0;
        data_in = 16'h10;
        @(posedge clk);
        data_in = 16'h111;
        @(posedge clk);
        data_in = 16'h112;
        @(posedge clk);
	$finish;
end
endmodule
