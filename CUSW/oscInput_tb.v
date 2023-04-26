//testbench for the osc inputs

`timescale 1 ns/100 ps
	
	module oscInput_tb;

	reg clk;
	reg [9:0] P0;
	reg [9:0] P1;
	wire [1:0] waveform;
	wire [3:0] detune;
	
	
	oscInput dut(

	clk, 
	P0, 
	P1,
	waveform,
	detune

);


always begin

		#5;
		clk = ~clk;
		
		
end 

integer i = 0;


initial begin 

		clk = 1'b0;
		
		
		#20; 
		
		for (i = 0; i<1024; i = i +1) begin //try each user input
		
		P0 = i;
		P1 = i;
		#15;
		
		end

	$stop;
		
end 


endmodule 
