/* TestingPoly

By: Jacob Williamson

Module Description:

This is a test module to see if the frequency lookup table 
and oscillators work together with polyphony.

Inputs:
clk 
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

module TestingPoly(

	input clk,
	input reset,
	input [1:0] ctrl,
	input [6:0] note1,
	input [6:0] note2,
	input [6:0] note3,
	input [6:0] note4,
	output [15:0] wave1,
	output [15:0] wave2,
	output [15:0] wave3,
	output [15:0] wave4
);
	
	wire [19:0] freq1;
	wire [19:0] freq2;
	wire [19:0] freq3;
	wire [19:0] freq4;
	
	wire [19:0] useless1;
	wire [19:0] useless2;
	wire [19:0] useless3;
	wire [19:0] useless4;
	wire [19:0] useless5;
	wire [19:0] useless6;
	wire [19:0] useless7;
	wire [19:0] useless8;
	wire [19:0] useless9;
	wire [19:0] useless10;
	wire [19:0] useless11;
	wire [19:0] useless12;
	
	PolyFreqLookup frequencies(
		clk,
		reset,
		note1,
		note2,
		note3,
		note4,
		7'h00,
		7'h00,
		7'h00,
		7'h00,
		7'h00,
		7'h00,
		7'h00,
		7'h00,
		7'h00,
		7'h00,
		7'h00,
		7'h00,
		freq1,
		freq2,
		freq3,
		freq4,
		useless1,
		useless2,
		useless3,
		useless4,
		useless5,
		useless6,
		useless7,
		useless8,
		useless9,
		useless10,
		useless11,
		useless12
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

endmodule 
