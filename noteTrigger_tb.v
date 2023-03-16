`timescale 1 ns / 100 ps


module noteTrigger_tb;

	reg clk;
	reg [3:0] counter;
	wire [15:0] Trigger;
	
	
	noteTrigger dut (
	
	clk,
	counter,
	Trigger
	
	);
	
	
	integer i;

 // testbench to see what happens for different time in values - no critical cases as such

initial begin
	
		clk <= 1'b0; #5; clk <= 1'b1; #5;
	
		for (i = 0; i<16; i = i +1) begin 
		
		counter = i;
		
		clk <= 1'b0; #5; clk <= 1'b1; #5;
		
		end
		
		
		for (i = 0; i<16; i = i +1) begin 
		
		counter = i;
		
		clk <= 1'b0; #5; clk <= 1'b1; #5;
		
		end
		
		$stop;
	end
	

	
endmodule

