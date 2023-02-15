//testbench for sustain value

`timescale 1 ns/100 ps

module SustainVariable_tb;

	reg clk;
	reg [9:0] user_input0;
	wire [3:0] sustainTime;
	
	
	SustainVariable dut (
	
	clk,
	user_input0,
	sustainTime
	
	);
	
	
	integer i;

 // testbench to see what happens for different time in values - no critical cases as such

initial begin
		clk <= 1'b0; #5; clk <= 1'b1; #5;
		clk <= 1'b0; #5; clk <= 1'b1; #5;
		
		user_input0 = 0;
		//for (i = 0; i<1010; i = i +1) begin 
		clk <= 1'b0; #5; clk <= 1'b1; #5;
		clk <= 1'b0; #5; clk <= 1'b1; #5;
		
		user_input0 = 300;
		clk <= 1'b0; #5; clk <= 1'b1; #5;
		clk <= 1'b0; #5; clk <= 1'b1; #5;
		clk <= 1'b0; #5; clk <= 1'b1; #5;
		
		user_input0 = 400;
		clk <= 1'b0; #5; clk <= 1'b1; #5;
		clk <= 1'b0; #5; clk <= 1'b1; #5;
		clk <= 1'b0; #5; clk <= 1'b1; #5;
		
		user_input0 = 500;
		clk <= 1'b0; #5; clk <= 1'b1; #5;
		clk <= 1'b0; #5; clk <= 1'b1; #5;
		clk <= 1'b0; #5; clk <= 1'b1; #5;
		
		user_input0 = 600;
		clk <= 1'b0; #5; clk <= 1'b1; #5;
		clk <= 1'b0; #5; clk <= 1'b1; #5;
		clk <= 1'b0; #5; clk <= 1'b1; #5;
		
		//end
		$stop;
	end
	

	
endmodule 