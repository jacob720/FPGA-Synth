module ReverbShroeder1(
	input RESET,
	input CLOCK48kHz,
	input [19:0] AudioIn,
	
	output [19:0] AudioOut
);

reg K = 1'b1;
reg K1 = 1'b1;
reg K2 = 1'b1;

assign AudioOut[1:0] = 2'b00;
wire [17:0] interconnect0;
wire [17:0] interconnect1;

CombFilter	Comb0(CLOCK48kHz, RESET, AudioIn[19:2], K, interconnect0);
AllPassFilter APF0( CLOCK48kHz, RESET, interconnect0>>1, K1, K2, interconnect1 );
AllPassFilter APF1( CLOCK48kHz, RESET, interconnect1>>1, K1, K2, AudioOut[19:2] );

//DEBUG:
//assign AudioOut[19:2] = interconnect1;


endmodule
