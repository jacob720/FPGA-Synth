`timescale 1 ns/100 ps

module PhaseAccumulator_tb;

	reg clk;
	reg reset;
	reg [36:0] phase_step;
	
	wire [36:0] phase;
	
	PhaseAccumulator dut(
		clk,
		reset,
		phase_step,
		phase
	);
	
	integer i;
	
	initial begin 
		phase_step = 3200000;
		reset = 1'b0;
		#10;
		reset = 1'b1;
		clk = 0;
		#10;
		reset = 1'b0;
		#10;
		
		for (i = 1; i < 1000000; i = i + 1) begin 
		
			clk = ~clk;
			#1;
			
			if (i % 250000 == 0) begin
				phase_step = phase_step*2;
			end
		
		end 
	
	$stop;
	
	end

endmodule
	
	