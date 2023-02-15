//testbench for the Variable CLk

`timescale 1 ns/100 ps

module VariableClkThreeSec_tb;

	reg clk;
	reg [9:0] user_input0;
	wire variableClk;
	
	
	VariableClkThreeSec dut (
	
	clk,
	user_input0,
	variableClk
	
	);
	
	
	integer i;

 // testbench to see what happens for different time in values - no critical cases as such

initial begin
	
		clk <= 1'b0; #5; clk <= 1'b1; #5;
	
	
		for (i = 0; i<400; i = i +1) begin 
		
		user_input0 = 200;
		clk <= 1'b0; #5; clk <= 1'b1; #5;
		
		end
		
		for (i = 0; i<400; i = i +1) begin 
		
		user_input0 = 25;
		clk <= 1'b0; #5; clk <= 1'b1; #5;
		
		end
		
		for (i = 0; i<100; i = i +1) begin 
		
		user_input0 = 0;
		clk <= 1'b0; #5; clk <= 1'b1; #5;
		
		end
		
		for (i = 0; i<60; i = i +1) begin 
		
		user_input0 = 25;
		clk <= 1'b0; #5; clk <= 1'b1; #5;
		
		end
		
		$stop;
	end
	

	
endmodule 