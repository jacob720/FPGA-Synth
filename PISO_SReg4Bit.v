module PISO_SReg4Bit(
	input clock,
	input load,
	input [3:0] data,
	
	output SerialOut
);

//when load == 1, loads input on posedge of clock
//when load == 0, shifts output right; LSB becomes 1
//SerialOut always shows MSB
//reference: https://youtu.be/7LmBcGiiYwk?t=297

//load is just notShift
wire shift;
not(shift, load);

//FF interconnects
wire [2:0] FFinter;
wire [8:0] FFLogic;

//0th SReg (LSB)
DTypeFF FF0(clock, data[0], FFinter[0]);


//1st FF (bit 1)
and(FFLogic[0], FFinter[0], shift);
and(FFLogic[1], data[1], load);
or(FFLogic[2], FFLogic[0], FFLogic[1]);

DTypeFF FF1(clock, FFLogic[2], FFinter[1]);

//2nd FF (bit 2)
and(FFLogic[3], FFinter[1], shift);
and(FFLogic[4], data[2], load);
or(FFLogic[5], FFLogic[3], FFLogic[4]);

DTypeFF FF2(clock, FFLogic[5], FFinter[2]);

//3rd FF (MSB)
and(FFLogic[6], FFinter[2], shift);
and(FFLogic[7], data[3], load);
or(FFLogic[8], FFLogic[6], FFLogic[7]);

DTypeFF FF3(clock, FFLogic[8], SerialOut);


endmodule
