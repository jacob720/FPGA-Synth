`timescale 1 ns/100 ps

module Oscillator_tb;

	reg clk;
	reg reset;
	reg [19:0] freq;
	reg [1:0] ctrl;
	reg [3:0] detune;
	wire [15:0] wave;
	
	Oscillator dut(
		clk,
		reset,
		freq,
		ctrl,
		detune,
		wave
	);
	
	integer i;
	integer total_cycles;
	
	initial begin
		
		total_cycles = 500000;
		
		clk = 0;
		ctrl = 2'b00;
		detune = 0;
		freq = 14080;		//440 Hz
		reset = 1'b0;
		#10;
		reset = 1'b1;
		#10;
		reset = 1'b0;
		#10;
		
		for (i = 1; i < total_cycles; i = i + 1) begin
		
			clk = ~clk;
			#10416;			// 48kHz clock
			
			if ((i % (total_cycles/4)) == 0) begin
				ctrl = ctrl + 1;
				detune = 0;
			end else if ((i % (total_cycles/16)) == 0) begin
				detune = detune + 5;
			end
			
		end
		
	$stop;
		
	end
	
endmodule
		