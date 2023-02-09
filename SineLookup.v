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
	wire [7:0] inverse_phase;
	reg [5:0] quartered_phase;
	wire [15:0] pos_wave;
	
	
	EightBitFullAdder adder1(
		~phase,
		8'b00000000,
		1'b1,
		inverse_phase,
		useless[0]
	);
	
	
	SineTable sine_table(
		quartered_phase,
		pos_wave
	);
		
	
	always @ (*) begin
	
		if (phase < 64) begin
			quartered_phase <= phase[5:0];
			sinewave <= pos_wave;
		end else if (phase < 128) begin
			quartered_phase <= ~phase[5:0];
			sinewave <= pos_wave;
		end else if (phase < 192) begin
			quartered_phase <= phase[5:0];
			sinewave <= ~pos_wave;
		end else if (phase < 256) begin
			quartered_phase <= ~phase[5:0];
			sinewave <= ~pos_wave;
		end
		
	end
	
endmodule
	