module DEMUX_8output_1bit(
	input in,
	input [2:0]sel,
	output reg a,
	output reg b,
	output reg c,
	output reg d,
	output reg e,
	output reg f,
	output reg g,
	output reg h,
	
	output reg out
);

	always @ (in or sel) begin // https://www.javatpoint.com/verilog-multiplexer
		
		case(sel)
		
			3'b000:  a <= in;
			3'b001:  b <= in;
			3'b010:  c <= in;
			3'b011:  d <= in;
			3'b100:  e <= in;
			3'b101:  f <= in;
			3'b110:  g <= in;
			3'b111:  h <= in;
		
		endcase
		
	end

endmodule