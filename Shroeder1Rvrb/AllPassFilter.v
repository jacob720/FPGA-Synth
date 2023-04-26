module AllPassFilter(
	input CLOCK48kHz,
	input RESET,
	input [17:0] audioIn,
	input K1,
	input K2,
	
	output [17:0] audioOut
);


wire [17:0] interconnect1;
wire [17:0] interconnect2;
wire [17:0] interconnect3;
wire [17:0] interconnect4;
wire [17:0] interconnect5;
//wire [22:0]	feedback;
wire useless;

FullAdder18bit mixPreDelay(audioIn, (~RESET & audioOut)>>2, 1'b0, interconnect1, useless);

Delay1CC z1(CLOCK48kHz, interconnect1, interconnect2);
//Delay1CC z2(CLOCK48kHz, interconnect2, interconnect3);

FullAdder18bit mixPostDelay(interconnect2, audioIn>>1, 1'b0, audioOut, useless);


endmodule
