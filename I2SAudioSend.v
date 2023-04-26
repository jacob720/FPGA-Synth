module I2SAudioSend(
	input BCLK,
	input CLOCK48kHz,
	//input LOut[23:0],
	//input ROut[23:0],
	input [19:0] AudioInLeft, 
	//input PROTO_RLOutData,
	
	output DACLRC,
	output DACDAT
	
	//DEBUG
	//output DACDAT_L;
	//output DACDAT_R;
);
//wires for unsigned to 2s Complement conversion
wire [23:0] Audio2sComplLeft;
wire [19:0]	InterConnect;
wire [31:0] SRAudioL;
//wire [19:0] AudioUnsignedMONO;
//wire [31:0]
//define storage for the data
wire DACDATL;
wire SRegL;

wire DACDATR;
wire SRegR;

//just outputting all 1s or all 0s
//assign DACDAT = PROTO_RLOutData;

//assign AudioUnsignedMONO[19:15] = {PROTO_RLOutData, PROTO_RLOutData, PROTO_RLOutData, PROTO_RLOutData, PROTO_RLOutData};
//assign AudioUnsignedMONO[14:0] = 14'd0;

//create 2's complement from unsigned original signal
//BinaryTo2sCompl AudioTo2sCompl(AudioUnsignedMONO, Audio2sComplLeft);
BinaryTo2sCompl AudioTo2sCompl(AudioInLeft, Audio2sComplLeft);

//shift registers for both audio channels
//bits 0 and 1 are not important! it is only bits 2 to 25 that matter

assign SRAudioL = {2'b01, Audio2sComplLeft, 6'b000000};



PISO_SReg32Bit AudioI2SLeft(~BCLK, ~CLOCK48kHz, SRAudioL, SRegL);
PISO_SReg32Bit AudioI2SRight(~BCLK, CLOCK48kHz, SRAudioL, SRegR);

//GLITCH
and(DACDATL, SRegL, CLOCK48kHz);
and(DACDATR, SRegR, ~CLOCK48kHz);
or(DACDAT, DACDATL, DACDATR);

//or(DACDAT, DACDAT_L, DACDAT_R);

//tbh this might stay until final version
assign DACLRC = CLOCK48kHz;



endmodule
