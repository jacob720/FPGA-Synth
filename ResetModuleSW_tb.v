//testbench for the reset module


`timescale 1 ns/100 ps
	
	module ResetModuleSW_tb;

	reg clk;
	reg locked;
	reg DACReadyFlag;
	
	
	wire [6:0] volume; //for the dac
	
	wire areset; //for the PLL

	wire reset_enable; //for pot values
	wire reset; //active hive reset
	wire reset_n; //active low reset
	//wire xn; //test
	
	
	ResetModuleSW dut(

	clk, //50mhz on board system clock
	locked, //locked PLL signal
	DACReadyFlag,
	volume, //for the dac
	
	areset, //for the PLL

	reset_enable, //for pot values
	reset, //active hive reset
	reset_n //active low reset
	//xn //test

);

always begin

		#5;
		clk = ~clk;
		
		
end 



initial begin 

		clk = 1'b0;
		locked = 1'b0;
		DACReadyFlag = 1'b0;
		
		
		#1000;
		
		locked = 1'b1;
		
		#1000;
		
		DACReadyFlag = 1'b1;
		#1000;
		
	$stop;
		
end 

endmodule
		
		
		
