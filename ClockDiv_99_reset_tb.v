`timescale 1ns/100ps

module ClockDiv_99_reset_tb;

 reg clk;
 reg [18:0] Cin;
 wire reset;
 
 integer i; //to simulate the counter output, timeIn
 
 

 ClockDiv_99_reset dut(

	clk,
	Cin,
	reset


);
 
 always begin
	
	#10;
	
	clk <= ~ clk;
	
	end
 
 
 // testbench to see what happens for different cin values - no critical cases as such
 
 initial begin
	#3
	clk <= 1'b0;	
	#3
	clk <= 1'b1; //intialise the clk

	for (i = 0; i<5000000; i = i +1) begin
		
		Cin = i;
		
		#20;
		
		end
	#2000
	$stop;
	
end

endmodule
