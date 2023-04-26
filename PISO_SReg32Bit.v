module PISO_SReg32Bit(
	input clock,
	input load,
	input [31:0] data,
	
	output SerialOut
);

//shift = ~load;
wire shift;
not(shift, load);

//SREG interconnects
wire [6:0] SRinter;
wire [20:0] SRLogic;
wire [3:0] SR1_in, SR2_in, SR3_in, SR4_in, SR5_in, SR6_in, SR7_in;

//now we just need 8 4Bit SRegs :))
//0th SReg (LSB to bit 3)
PISO_SReg4Bit SR4b_0(clock, load, data[3:0], SRinter[0]);


//1st SReg (bit 4 to 7)
and(SRLogic[0], SRinter[0], shift);
and(SRLogic[1], data[4], load);
or(SRLogic[2], SRLogic[1], SRLogic[0]);

assign SR1_in = {data[7:5], SRLogic[2]};

PISO_SReg4Bit SR4b_1(clock, load, SR1_in, SRinter[1]); //note array of wires here

//2nd SReg (bit 8 to 11)
and(SRLogic[3], SRinter[1], shift);
and(SRLogic[4], data[8], load);
or(SRLogic[5], SRLogic[4], SRLogic[3]);

assign SR2_in = {data[11:9], SRLogic[5]};

PISO_SReg4Bit SR4b_2(clock, load, SR2_in, SRinter[2]);

//3rd SReg (bit 12 to 15)
and(SRLogic[6], SRinter[2], shift);
and(SRLogic[7], data[12], load);
or(SRLogic[8], SRLogic[7], SRLogic[6]);

assign SR3_in = {data[15:13], SRLogic[8]};

PISO_SReg4Bit SR4b_3(clock, load, SR3_in, SRinter[3]);

//4th SReg (bit 16 to 19)
and(SRLogic[9], SRinter[3], shift);
and(SRLogic[10], data[16], load);
or(SRLogic[11], SRLogic[10], SRLogic[9]);

assign SR4_in = {data[19:17], SRLogic[11]};

PISO_SReg4Bit SR4b_4(clock, load, SR4_in, SRinter[4]); //note array of wires here

//5th SReg (bit 20 to 23)
and(SRLogic[12], SRinter[4], shift);
and(SRLogic[13], data[20], load);
or(SRLogic[14], SRLogic[13], SRLogic[12]);

assign SR5_in = {data[23:21], SRLogic[14]};

PISO_SReg4Bit SR4b_5(clock, load, SR5_in, SRinter[5]);

//2nd SReg (bit 8 to 11)
and(SRLogic[15], SRinter[5], shift);
and(SRLogic[16], data[24], load);
or(SRLogic[17], SRLogic[16], SRLogic[15]);

assign SR6_in = {data[27:25], SRLogic[17]};

PISO_SReg4Bit SR4b_6(clock, load, SR6_in, SRinter[6]);

//3rd SReg (bit 12 to 15)
and(SRLogic[18], SRinter[6], shift);
and(SRLogic[19], data[28], load);
or(SRLogic[20], SRLogic[19], SRLogic[18]);

assign SR7_in = {data[31:29], SRLogic[20]};

PISO_SReg4Bit SR4b_7(clock, load, SR7_in, SerialOut);


endmodule

