`timescale 10 ns/ 1 ns

module WM8731DriverBETA_tb(
);

reg RESET;
reg CLOCK50M;
reg InitialiseTransfer;
reg [15:0] message;
	
wire SCLK;	//I2C clock line
wire SDIN;	//I2C data line
	
wire MCLK;		//WM8731 masterClock (default: )
	
wire BCLK;		//I2S clock
wire DACLRC;		//I2S left/right select (0 = left, 1 = right; 0 goes first)
wire DACDAT;		//I2S data line


WM8731DriverBETA dut(RESET, CLOCK50M, InitialiseTransfer, message, SCLK, SDIN, MCLK, BCLK, DACLRC, DACDAT);

always begin
#1;
CLOCK50M = ~CLOCK50M;
end


initial begin

//initial conditions
	CLOCK50M = 0;
	RESET = 0;
	InitialiseTransfer = 0;
	message = 16'hFAFA;

//reset
	#5.5;
	RESET = 1;
	#1.5
	RESET = 0;
	#2;

//set up WM8731
	InitialiseTransfer = 1;
	#500;
	InitialiseTransfer = 0;
	#2;
	message = 16'h8F8F;
	#2;
	InitialiseTransfer = 1;
	#10;
	InitialiseTransfer = 0;
	#100;
	

//wait to see if audio is sent
	#8000;

//end simulation
	$stop;
end



endmodule
