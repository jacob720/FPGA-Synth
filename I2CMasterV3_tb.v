`timescale 10 ns/1 ns


module I2CMasterV3_tb();

	reg RESET;
	reg CLOCK50M;
	reg InitialiseTransfer;
	reg [15:0] message;
	
	
	wire SCLK;	//I2C clock line
	wire SDIN;	//I2C data line
	//wire [31:0] DEBUG_SReg;
	//wire [5:0] DEBUG_count;
	//wire DEBUG_SReg_clock;
	
	
I2CMasterV3 dut(RESET, CLOCK50M, InitialiseTransfer, message, SCLK, SDIN, DEBUG_count); //, DEBUG_SReg, DEBUG_count, DEBUG_SReg_clock

always begin
	#1;
	CLOCK50M <= ~CLOCK50M;
end

initial begin

//initial inputs
	CLOCK50M <= 0;
	RESET <= 0;
	InitialiseTransfer <= 0;
	message <= 16'hFAFA;
	
//reset	
	#15.5;
	RESET <= 1;
	#2.5; 
	RESET <= 0;
	
//initialise transfer	
	#5;
	InitialiseTransfer <= 1;
	#10;
	InitialiseTransfer <= 0;
	#300;
	
//stop simulation
	#2
	$stop;
	
end

	

endmodule
