`timescale 1ns/100ps

module ClockDivider50MHzTo100Hz_tb;

	reg CLK_50_MHz;
	reg reset_n;
	wire CLK_100Hz;
	
	always begin
	
	#10;
	
	CLK_50_MHz <= ~ CLK_50_MHz;
	
	end
	
	
	initial begin
	reset_n = 1'b1; //everything into a known state
   #3
	reset_n = 1'b0;
	#3
	reset_n = 1'b1;
	#3
	CLK_50_MHz = 1'b1;
	
	#14343567	//random not integer so that the reset does trigger the clock
	reset_n = 1'b1; //everything into a known state
   #3
	reset_n = 1'b0;
	#3
	reset_n = 1'b1;
	#10000000
	
	$stop;
	end
	
	
	
	ClockDivider50MHzTo100Hz dut(
		CLK_50_MHz,
		reset_n,
		CLK_100Hz
	);
	
	endmodule
	