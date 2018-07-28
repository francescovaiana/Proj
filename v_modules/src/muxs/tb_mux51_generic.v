module tb_mux51_generic();
reg clk, rst;
reg [7:0] a , b, c, d, e;
reg [2:0]sel;
wire [7:0]y;

mux51_generic #(.bit_width(8)) DUT(
.a(a),
.b(b),
.c(c),
.d(d),
.e(e),
.s(sel),
.y(y)
);

initial begin
	clk = 1'b0;
	rst = 1'b1;
	repeat(4) #10 clk=~clk;
	rst = 1'b0;
	forever #10 clk=~clk;
end

initial begin
	a = 8'h00;
	b = 8'h02;
	c = 8'h04;
	d = 8'h06;
	e = 8'h08;
	sel = 3'b000;
	@(negedge rst);
	repeat(2) @(posedge clk);
	@(posedge clk);
	a = 8'h00;
	b = 8'h02;
	c = 8'h04;
	d = 8'h06;
	e = 8'h08;
	sel = 3'b001;
	@(posedge clk);
	a = 8'h00;
	b = 8'h02;
	c = 8'h04;
	d = 8'h06;
	e = 8'h08;
	sel = 3'b010;
	@(posedge clk);
	a = 8'h00;
	b = 8'h02;
	c = 8'h04;
	d = 8'h06;
	e = 8'h08;
	sel = 3'b011;
	@(posedge clk);
	a = 8'h00;
	b = 8'h02;
	c = 8'h04;
	d = 8'h06;
	e = 8'h08;
	sel = 3'b100;
	@(posedge clk);
	a = 8'h00;
	b = 8'h02;
	c = 8'h04;
	d = 8'h06;
	e = 8'h08;
	sel = 3'b101;
	@(posedge clk);
	$finish;
end

endmodule


