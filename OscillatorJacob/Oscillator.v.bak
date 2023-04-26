/* Oscillator.v

By: Jacob Williamson

Module Description:
A module produce a sine, saw or square wave output.

Inputs:
clk - clock signal driving the module.
reset - reset nit to set phase of wave to 0.
freq [19:0] - frequency in Hz of the waves.
ctrl [1:0] - control bits to determine which waveform is produced.
		00 -> saw
		01 -> square
		10 -> sine
		11 -> triangle
detune [3:0] - detune the oscillator
Outputs:
wave [15:0] - the wave.

*/

module Oscillator(
	input clk,
	input reset,
	input [19:0] freq,
	input [1:0] ctrl,
	input [3:0] detune,
	output reg [15:0] wave_out
);
	
	wire [16:0] multiplier1;
	wire [16:0] multiplier2;
	wire [16:0] multiplier3;
	wire [16:0] multiplier4;
	
	wire [31:0] phase_step1;
	wire [31:0] phase_step2;
	wire [31:0] phase_step3;
	wire [31:0] phase_step4;
	
	wire [15:0] wave1;
	wire [15:0] wave2;
	wire [15:0] wave3;
	wire [15:0] wave4;
	
	wire [16:0] wave1_2;
	wire [16:0] wave3_4;
	wire [17:0] combined_wave;
	
	wire [3:0] overflow;
	
	assign phase_step1 = multiplier1 * freq;
	assign phase_step2 = multiplier2 * freq;
	assign phase_step3 = multiplier3 * freq;
	assign phase_step4 = multiplier4 * freq;
	
	SeventeenBitFullAdder adder1(
		17'd89478,   								// based on 2^n and clock freq
		{7'b0000000, detune, 6'b000000},
		1'b0,
		multiplier1,
		overflow[0]
	);
	
	SeventeenBitFullAdder adder2(
		17'd89478,
		~{7'b0000000, detune, 6'b000000},
		1'b1,
		multiplier2,
		overflow[1]
	);
	
	SeventeenBitFullAdder adder3(
		17'd89478,
		{6'b000000, detune, 7'b0000000},
		1'b0,
		multiplier3,
		overflow[2]
	);
	
	SeventeenBitFullAdder adder4(
		17'd89478,
		~{6'b000000, detune, 7'b0000000},
		1'b1,
		multiplier4,
		overflow[3]
	);
	
	OscillatorSingle oscillator1(
		clk,
		reset,
		phase_step1,
		ctrl,
		wave1
	);
	
	OscillatorSingle oscillator2(
		clk,
		reset,
		phase_step2,
		ctrl,
		wave2
	);
	
	OscillatorSingle oscillator3(
		clk,
		reset,
		phase_step3,
		ctrl,
		wave3
	);
	
	OscillatorSingle oscillator4(
		clk,
		reset,
		phase_step4,
		ctrl,
		wave4
	);
		
	SixteenBitFullAdder adder5(
		wave1,
		wave2,
		1'b0,
		wave1_2[15:0],
		wave1_2[16]
	);
	
	SixteenBitFullAdder adder6(
		wave3,
		wave4,
		1'b0,
		wave3_4[15:0],
		wave3_4[16]
	);
	
	SeventeenBitFullAdder adder7(
		wave1_2,
		wave3_4,
		1'b0,
		combined_wave[16:0],
		combined_wave[17]
	);
	
	always @(posedge clk) begin
	
		if (detune) begin
			wave_out <= combined_wave[17:2];
		end else begin
			wave_out <= wave1;
		end
		
	end
	
endmodule 