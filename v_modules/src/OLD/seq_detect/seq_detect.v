module three_ones(clk, rst, oe, in, detect);
input clk, rst, oe, in;
output detect;

reg[1:0] cs, ns;
wire ungated_detect;

parameter NO_ONES=0, ONE_ONE=1, TWO_ONES=2,AT_LEAST_THREE_ONES=3;

/***STRUCTURAL DESCRIPTION***/

buffer_ts t1(ungated_detect, oe, detect);

always @(posedge clk) begin
	cs = ns;
end

/***FUNCTIONAL DESCRIPTION***/
function detect_logic;
input[1:0] cs;
input rst;
input signal;
begin
	detect_logic = 0;
	if (signal == 0 | rst == 1)
		ns = NO_ONES;
	else
	case (cs)
	NO_ONES: ns = ONE_ONE;
	ONE_ONE: ns = TWO_ONES;
	TWO_ONES, AT_LEAST_THREE_ONES:
		begin
			ns = AT_LEAST_THREE_ONES;
			detect_logic = 1;
		end
	endcase
	end
endfunction

assign ungated_detect = detect_logic(cs, rst, in); 		
		
endmodule
