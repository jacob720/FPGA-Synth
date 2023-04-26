module I2CMasterV3(
	input RESET,
	input CLOCK50M,
	input InitialiseTransfer,
	input [15:0] message,
	
	output SCLK,	//I2C clock line
	output SDIN	//I2C data line
	//output [31:0] DEBUG_SReg,
	//output [5:0] DEBUG_count
	//output DEBUG_SReg_Clock
);

//wires
wire I2CMasterClock; //slower clock for internal operation
//wire nRESET;
wire nInitialiseTransfer;
wire [31:0] SRegInput;
wire SR_LOAD;
wire [5:0] count;
wire NORcount;

wire CountReset;
wire SReg_Clock;

nor(NORcount, count[5], count[4], count[3], count[2], count[1], count[0]);
or(SCLK, count[0], NORcount); //bypass 0 in SCLK

//clock
assign I2CMasterClock = CLOCK50M;
//not(nRESET, RESET);
not(nInitialiseTransfer, InitialiseTransfer);

//SReg32Bit variables

//assign DEBUG_SReg = SRegInput;
//assign DEBUG_SReg_Clock = SReg_Clock;



//SReg32Bit clock driver
SR32CLOCKdriver SR32bitCLOCKdriver(I2CMasterClock, ~NORcount, RESET, SReg_Clock);

//ShiftRegister
assign SRegInput = {2'b10, 9'b001101000, message[15:8], 1'b0, message[7:0], 4'b0111};
assign SR_LOAD = count[0];
PISO_SReg32Bit I2CmessageSReg(SReg_Clock, SR_LOAD, SRegInput, SDIN);


//COUNTER and MCLK
//assign DEBUG_count = count;

//6-bit counter (reset sets count to 6'b111111)
SixBitCounter I2CMasterCounter(I2CMasterClock, CountReset, count);

//if RESET is turned on, CountReset activates (posedge)
//if InitialiseTransfer is turned on, counter starts incrementing (posedge)
I2CCounterControlLogic CounterCtrl( RESET, InitialiseTransfer, count, CountReset );

	
//end of I2CMasterV2
endmodule
