//Sophie Watson
//21/1/23
//single register for storing frequencies
//20 bit - 15 for storing number (up to 20k), 4 decimal places

module FrequencyMemReg (

	input [19:0] IN,
	input LOAD,
	input clk,
	output wire [19:0] OUT

); 

//connecting 28 DFF together in a registor

OneBitReg Reg0 (

	IN[0],
	LOAD,
	clk,
	OUT[0]

);

OneBitReg Reg1 (

	IN[1],
	LOAD,
	clk,
	OUT[1]

);

OneBitReg Reg2 (

	IN[2],
	LOAD,
	clk,
	OUT[2]

);

OneBitReg Reg3 (

	IN[3],
	LOAD,
	clk,
	OUT[3]

);

OneBitReg Reg4 (

	IN[4],
	LOAD,
	clk,
	OUT[4]

);

OneBitReg Reg5 (

	IN[5],
	LOAD,
	clk,
	OUT[5]

);

OneBitReg Reg6 (

	IN[6],
	LOAD,
	clk,
	OUT[6]

);

OneBitReg Reg7 (

	IN[7],
	LOAD,
	clk,
	OUT[7]

);

OneBitReg Reg8 (

	IN[8],
	LOAD,
	clk,
	OUT[8]

);

OneBitReg Reg9 (

	IN[9],
	LOAD,
	clk,
	OUT[9]

);

OneBitReg Reg10 (

	IN[10],
	LOAD,
	clk,
	OUT[10]

);

OneBitReg Reg11 (

	IN[11],
	LOAD,
	clk,
	OUT[11]

);

OneBitReg Reg12 (

	IN[12],
	LOAD,
	clk,
	OUT[12]

);

OneBitReg Reg13 (

	IN[13],
	LOAD,
	clk,
	OUT[13]

);

OneBitReg Reg14 (

	IN[14],
	LOAD,
	clk,
	OUT[14]

);

OneBitReg Reg15 (

	IN[15],
	LOAD,
	clk,
	OUT[15]

);

OneBitReg Reg16 (

	IN[16],
	LOAD,
	clk,
	OUT[16]

);

OneBitReg Reg17 (

	IN[17],
	LOAD,
	clk,
	OUT[17]

);

OneBitReg Reg18 (

	IN[18],
	LOAD,
	clk,
	OUT[18]

);

OneBitReg Reg19 (

	IN[19],
	LOAD,
	clk,
	OUT[19]

);

endmodule