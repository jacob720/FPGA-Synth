/* TestingPoly2

By: Jacob Williamson

Module Description:

This is a test module to see if the chords module, frequency lookup table 
and oscillators work together with polyphony.

Inputs:
clk 
slow_clk
reset
ctrl
note1 
note2
note3
note4

Outputs:
wave1
wave2
wave3
wave4

*/

module TestingPoly2(
	input clk,
	input slow_clk,
	input reset,
	input [1:0] ctrl,
	output [15:0] wave1,
	output [15:0] wave2,
	output [15:0] wave3,
	output [15:0] wave4,
	output [15:0] wave5,
	output [15:0] wave6,
	output [15:0] wave7,
	output [15:0] wave8,
	output [15:0] wave9,
	output [15:0] wave10,
	output [15:0] wave11,
	output [15:0] wave12,
	output [15:0] wave13,
	output [15:0] wave14,
	output [15:0] wave15,
	output [15:0] wave16,
	output [19:0] mixed_signal
);
	
	wire [6:0] note1;
	wire [6:0] note2;
	wire [6:0] note3;
	wire [6:0] note4;
	wire [6:0] note5;
	wire [6:0] note6;
	wire [6:0] note7;
	wire [6:0] note8;
	wire [6:0] note9;
	wire [6:0] note10;
	wire [6:0] note11;
	wire [6:0] note12;
	wire [6:0] note13;
	wire [6:0] note14;
	wire [6:0] note15;
	wire [6:0] note16;
	
	wire [19:0] freq1;
	wire [19:0] freq2;
	wire [19:0] freq3;
	wire [19:0] freq4;
	wire [19:0] freq5;
	wire [19:0] freq6;
	wire [19:0] freq7;
	wire [19:0] freq8;
	wire [19:0] freq9;
	wire [19:0] freq10;
	wire [19:0] freq11;
	wire [19:0] freq12;
	wire [19:0] freq13;
	wire [19:0] freq14;
	wire [19:0] freq15;
	wire [19:0] freq16;
	
	Chords chords(
		slow_clk,
		reset,
		2'b00,
		note1,
		note2,
		note3,
		note4,
		note5,
		note6,
		note7,
		note8,
		note9,
		note10,
		note11,
		note12,
		note13,
		note14,
		note15,
		note16
	);
	
	PolyFreqLookup frequencies(
		clk,
		reset,
		note1,
		note2,
		note3,
		note4,
		note5,
		note6,
		note7,
		note8,
		note9,
		note10,
		note11,
		note12,
		note13,
		note14,
		note15,
		note16,
		freq1,
		freq2,
		freq3,
		freq4,
		freq5,
		freq6,
		freq7,
		freq8,
		freq9,
		freq10,
		freq11,
		freq12,
		freq13,
		freq14,
		freq15,
		freq16
	);
		
	Oscillator oscillator1(
		clk,
		reset,
		freq1,
		ctrl,
		wave1
	);
	
	Oscillator oscillator2(
		clk,
		reset,
		freq2,
		ctrl,
		wave2
	);
	
	Oscillator oscillator3(
		clk,
		reset,
		freq3,
		ctrl,
		wave3
	);
	
	Oscillator oscillator4(
		clk,
		reset,
		freq4,
		ctrl,
		wave4
	);
	
	Oscillator oscillator5(
		clk,
		reset,
		freq5,
		ctrl,
		wave5
	);
	
	Oscillator oscillator6(
		clk,
		reset,
		freq6,
		ctrl,
		wave6
	);
	
	Oscillator oscillator7(
		clk,
		reset,
		freq7,
		ctrl,
		wave7
	);
	
	Oscillator oscillator8(
		clk,
		reset,
		freq8,
		ctrl,
		wave8
	);
	
	Oscillator oscillator9(
		clk,
		reset,
		freq9,
		ctrl,
		wave9
	);
	
	Oscillator oscillator10(
		clk,
		reset,
		freq10,
		ctrl,
		wave10
	);
	
	Oscillator oscillator11(
		clk,
		reset,
		freq11,
		ctrl,
		wave11
	);
	
	Oscillator oscillator12(
		clk,
		reset,
		freq12,
		ctrl,
		wave12
	);
	
	Oscillator oscillator13(
		clk,
		reset,
		freq13,
		ctrl,
		wave13
	);
	
	Oscillator oscillator14(
		clk,
		reset,
		freq14,
		ctrl,
		wave14
	);
	
	Oscillator oscillator15(
		clk,
		reset,
		freq15,
		ctrl,
		wave15
	);
	
	Oscillator oscillator16(
		clk,
		reset,
		freq16,
		ctrl,
		wave16
	);
	
	Mixer16 mixer(
		clk,
		wave1,
		wave2,
		wave3,
		wave4,
		wave5,
		wave6,
		wave7,
		wave8,
		wave9,
		wave10,
		wave11,
		wave12,
		wave13,
		wave14,
		wave15,
		wave16,
		mixed_signal
	);

endmodule 
