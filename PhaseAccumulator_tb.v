`timescale 1 ns/100 ps

module PhaseAccumulator_tb;

	reg clk;
	reg [31:0] phase_step;
	reg reset;
	
	wire [31:0] phase;
	
	PhaseAccumulator dut(
		clk,
		phase_step,
		reset,
		phase
	);
	
	integer i;
	
	initial begin 
		phase_step = 100000;
		reset = 1'b0;
		#10;
		reset = 1'b1;
		clk = 0;
		#10;
		reset = 1'b0;
		#10;
		
		for (i = 0; i < 1000000; i = i + 1) begin 
		
			clk = ~clk;
			#1;
		
		end 
	
	$stop;
	
	end

endmodule
	
	