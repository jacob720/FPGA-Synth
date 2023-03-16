`timescale 1 ns / 100 ps


module VariableClkSeq_tb;

	reg clk100hz;
	reg [9:0] user_input0;
	wire variableClk;
	
	
	VariableClkSeq dut (
	
	clk100hz,
	user_input0,
	variableClk
	
	);
	
	
	integer i;

 // testbench to see what happens for different time in values - no critical cases as such

initial begin
	
		clk100hz <= 1'b0; #5; clk100hz <= 1'b1; #5;
	
		for (i = 0; i<1023; i = i +1) begin 
		
		user_input0 = 200;
		
		clk100hz <= 1'b0; #5; clk100hz <= 1'b1; #5;
		
		end
		
		clk100hz <= 1'b0; #5; clk100hz <= 1'b1; #5;
	
		for (i = 0; i<1023; i = i +1) begin 
		
		user_input0 = 300;
		
		clk100hz <= 1'b0; #5; clk100hz <= 1'b1; #5;
		
		end
		
		for (i = 0; i<1023; i = i +1) begin 
		
		user_input0 = 25;
		
		clk100hz <= 1'b0; #5; clk100hz <= 1'b1; #5;
		
		end
		
		for (i = 0; i<103; i = i +1) begin 
		
		user_input0 = 0;
		
		clk100hz <= 1'b0; #5; clk100hz <= 1'b1; #5;
		
		end
		
		for (i = 0; i<4023; i = i +1) begin 
		
		user_input0 = 700;
		
		clk100hz <= 1'b0; #5; clk100hz <= 1'b1; #5;
		
		end
		
		$stop;
	end
	

	
endmodule

