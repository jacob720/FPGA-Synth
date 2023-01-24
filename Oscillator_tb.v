`timescale 1 ns/100 ps

module Oscillator_tb;

	reg clk;
	reg [19:0] freq;
	reg [1:0] ctrl;
	reg reset;
	wire [15:0] wave;
	
	Oscillator dut(
		clk,
		freq,
		ctrl,
		reset,
		wave
	);
	
	integer i;
	integer total_cycles;
	
	initial begin
		
		total_cycles = 5000000;
		
		clk = 0;
		ctrl = 2'b00;
		freq = 440;
		reset = 1'b0;
		#10;
		reset = 1'b1;
		#10;
		reset = 1'b0;
		#10;
		
		for (i = 1; i < total_cycles; i = i + 1) begin
		
			clk = ~clk;
			#10;
			
			if ((i % (total_cycles/4)) == 0) begin
				ctrl = ctrl + 1;
			end
			
		end
		
	end
	
endmodule
		