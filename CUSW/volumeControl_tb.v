//testbench for the volume dac control module


`timescale 1 ns/100 ps
	
	module volumeControl_tb;

	reg clk; //50mhz
	reg [6:0]volumeBase; //volume as entered by the reset function - either 0 or -73db - 
	reg [9:0] userInput; //user input from arduino, between 0-1023
	
	wire [6:0]volume2DAC;
	wire volchange;
	
	
	volumeControl dut(

	clk, //50mhz on board system clock
	volumeBase,
	userInput,
	volume2DAC,
	volchange

);

always begin

		#5;
		clk = ~clk;
		
		
end 

integer i = 0;

initial begin 

		clk = 1'b0;
		userInput = 0;
		volumeBase = 0; //creating conditions of startup
		
		#100;
		
		userInput = 77; //user input has changed but dac still muted
		
		#100
		
		userInput = 128;
		volumeBase = 7'b0110000; //creating conditions of user changing after startup
		
		#100;
		
		for (i = 0; i<1024; i = i +1) begin 
		
		userInput = i;
		#15;
		
		end
		
		#100;
		
		userInput = 1023;
		
	$stop;
		
end 

endmodule
		
		
		
