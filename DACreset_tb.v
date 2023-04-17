//DAC reset testbench

`timescale 1 ns/100 ps
	
	module DACreset_tb;

	reg RESET;
	reg clk12Mhz;
	wire RESET_out;
	//wire [7:0] iTest; //show counters
	//wire [3:0] nTest; 
	wire pulse;
	wire DACReadyFlag;
	
	
	DACreset dut(

	RESET, 
	clk12Mhz, 
	RESET_out,
	//iTest,
	//nTest,
	pulse,
	DACReadyFlag

);

always begin

		#1;
		clk12Mhz = ~clk12Mhz;
		
		
end 



initial begin 

		clk12Mhz = 1'b0;
		RESET = 1'b0;
		#20; //run through to test
		
		RESET = 1'b1; //reset to start sequence
		#20;
		RESET = 1'b0;
		#10000
		
		RESET = 1'b1; //reset to interrupt sequence
		#20;
		RESET = 1'b0;
		#20000
		
		
	
	
		
	$stop;
		
end 


endmodule 
