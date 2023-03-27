`timescale 1 ns/100 ps

module OscillatorSingle_tb;

	reg clk;
	reg reset;
	reg [31:0] phase_step;
	reg [1:0] ctrl;
	wire [15:0] wave;
	
	OscillatorSingle dut(
		clk,
		reset,
		phase_step,
		ctrl,
		wave
	);
	
	integer i;
	integer total_cycles;
	
	initial begin
		
		total_cycles = 5000000;
		
		clk = 0;
		ctrl = 2'b00;
		phase_step = 440 * 32 * 89478;		//440 Hz
		reset = 1'b0;
		#10;
		reset = 1'b1;
		#10;
		reset = 1'b0;
		#10;
		
		for (i = 1; i < total_cycles; i = i + 1) begin
		
			clk = ~clk;
			#10416;									// 48kHz clock
			
			if ((i % (total_cycles/4)) == 0) begin
				ctrl = ctrl + 1;
			end
			
		end
		
	$stop;
		
	end
	
endmodule
		