module Sustain(
	input clk,
	input [4:0]sustain_level,
	input [19:0]in,
	output [19:0] out
);


	assign out = in >> sustain_level;

endmodule