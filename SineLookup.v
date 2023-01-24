/* SineLookup.v

By: Jacob Williamson

Module Description:
A lookup table containing a quarter of a sine wave.

Inputs:
phase [7:0] - phase of the sinewave.

Outputs:
sinewave [15:0] - the sinewave.

*/

module SineLookup(
	input [7:0] phase,
	output reg [15:0] sinewave
);

	wire useless[2:0];
	wire [7:0] neg_phase;
	wire [7:0] second_quarter;
	wire [7:0] third_quarter;
	wire [7:0] fourth_quarter;
	reg [7:0] quartered_phase;
	wire [15:0] pos_wave;
	wire [15:0] neg_wave;
	
	
	EightBitFullAdder adder1(
		~phase,
		8'b10000000,
		1'b1,
		second_quarter,
		useless[0]
	);
	
	EightBitFullAdder adder2(
		phase,
		8'b10000000,
		1'b0,
		third_quarter,
		useless[1]
	);
	
	EightBitFullAdder adder3(
		~phase,
		8'b00000000,
		1'b1,
		fourth_quarter,
		useless[2]
	);
	
	SineTable sine_table(
		quartered_phase,
		pos_wave
	);
		
	
	always @ (*) begin
	
		if (phase < 64) begin
			quartered_phase <= phase;
			sinewave <= pos_wave;
		end else if (phase < 128) begin
			quartered_phase <= second_quarter;
			sinewave <= pos_wave;
		end else if (phase < 192) begin
			quartered_phase <= third_quarter;
			sinewave <= ~pos_wave;
		end else if (phase < 256) begin
			quartered_phase <= fourth_quarter;
			sinewave <= ~pos_wave;
		end
		
	end
	
endmodule
	