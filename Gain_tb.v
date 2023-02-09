`timescale 1 ns/100 ps

module Gain_tb;
	
	reg clk;
	reg [19:0] wave_in;
	reg [7:0] gain;
	wire [19:0] wave_out;
	
	Gain dut(
		clk,
		wave_in,
		gain,
		wave_out
	);
	
	integer i;
	integer increment;
	
	initial begin 
		
		clk = 0;
		gain = 8'hFF;
		increment = -1;
		
		#10
		
		for (i = 0; i < 1000000000; i = i + 1000) begin
			wave_in = i;
			clk = ~clk;
			if (i % 100000 == 0) begin
				gain = gain + increment;
				if (gain == 0 || gain == 255) begin
					increment = increment * (-1);
				end
			end
			
			#10;
		end
	
	$stop;
	end
	
endmodule 
		
		