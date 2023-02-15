`timescale 1 ns/100 ps

module Comparator_tb;

	reg clk;
	reg [18:0] Cin;
	wire clk100_hz;
	
	
	Comparator dut (
	
	clk,
	Cin,
	clk100_hz
	
	);
	
	
	integer i;

 // testbench to see what happens for different time in values - no critical cases as such

initial begin
	
		clk <= 1'b0;
		
	   #3
		clk <= 1'b1;
		#3
		for (i = 0; i<5000000; i = i +1) begin 
		
		Cin = i;
		
		#20;
		
		end
		
			
		
		$stop;
	end
	
	always begin
	
		#10 
		clk <= ~clk;
		
	end 
	
	

	
endmodule 