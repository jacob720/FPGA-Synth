`timescale 1 ns/100 ps

module SineLookup_tb;

	reg [7:0] phase;
	wire [15:0] sinewave;
	
	SineLookup dut (
		phase,
		sinewave
	);
	
	integer i;
	
	initial begin
	
		for (i = 0; i < 10000; i = i + 1) begin
		
			phase = i;
			#10;
			
		end
	
	$stop;
	
	end
	
endmodule 
	