module CombFilter(
	input CLOCK48kHz,
	input RESET,
	input [17:0] audioIn,
	input K,
	
	output [17:0] audioOut
);

wire [17:0] interconnect;
//wire [22:0]	feedback;
wire useless;

FullAdder18bit mix(audioIn, (~RESET&audioOut)>>1, 1'b0, interconnect, useless);

Delay1CC z1(CLOCK48kHz, interconnect[17:0], audioOut);


endmodule
