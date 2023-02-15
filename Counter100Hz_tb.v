`timescale 1ns/100ps

module Counter100Hz_tb;
	reg CLK_50_MHz;
	reg reset_n;
	wire [17:0] c;

	
	
	Counter100Hz dut(
		 CLK_50_MHz,
	    reset_n,
	    c
	);
	
	always begin
	
	#10;
	
	CLK_50_MHz <= ~ CLK_50_MHz;
	
	end
	
	
	initial begin
	
	reset_n = 1'b1;
   #20
	reset_n = 1'b0;
	#20
	reset_n = 1'b1;
	#20
	CLK_50_MHz = 1'b1;
	#20
	#3000
	$stop;
	
	
	end
	
endmodule
