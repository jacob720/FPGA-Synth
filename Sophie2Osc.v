//to test: set everything as the none variable clock, see if it propergates
//monitor the variable clock output


module Sophie2Osc(

	input clk, //system 50mhz clk
	
	input reset, //active high
	input [1:0] ctrl, //for user to change chord, not yet in use
	input [9:0] userInput, //from arduino, for the variable clock length
	input enable, //for the mem reg containing user input, stops user from chagning all parameters

	//input [3:0] count_in, //to test

	output wire [19:0] memfrequency0, //output from memory (to go to osc)
	output wire [19:0] memfrequency1,
	output wire [19:0] memfrequency2,
	output wire [19:0] memfrequency3,
	output wire [19:0] memfrequency4,
	output wire [19:0] memfrequency5,
	output wire [19:0] memfrequency6,
	output wire [19:0] memfrequency7,
	output wire [19:0] memfrequency8,
	output wire [19:0] memfrequency9,
	output wire [19:0] memfrequency10,
	output wire [19:0] memfrequency11,
	output wire [19:0] memfrequency12,
	output wire [19:0] memfrequency13,
	output wire [19:0] memfrequency14,
	output wire [19:0] memfrequency15,
	
	output wire [15:0] Triggeradsr, //output to adsr, note on/off
	
	
	output wire end_count, //end of osc run (16)
	output reg clk100hzout2//special sophie clk - need an always clause at the bottom - going to adsr clock 
	//change to a reg for the always block

);

wire [19:0] userInput2;
wire [15:0] Triggermem;
wire clk100hz;
wire clk100hz2; //after mux

wire 	[19:0]   frequency0; //output from LUT (to go to memory)
wire 	[19:0]	frequency1;
wire 	[19:0]	frequency2;
wire 	[19:0]	frequency3;
wire 	[19:0]	frequency4;
wire 	[19:0]	frequency5;
wire 	[19:0]	frequency6;
wire 	[19:0]	frequency7;
wire 	[19:0]	frequency8;
wire 	[19:0]	frequency9;
wire 	[19:0]	frequency10;
wire 	[19:0]	frequency11;
wire 	[19:0]	frequency12;
wire 	[19:0]	frequency13;
wire 	[19:0]	frequency14;
wire 	[19:0]	frequency15;
wire notreset; //to turn the reset from active low to active high for the clock




FrequencyMemReg userinreg (

	userInput,
	enable,
	clk,
	userInput2

); 


//100hz clock div

not(notreset, reset);


ClockDivider50MHzTo100Hz clock100hzboi(
	clk,
	notreset,
	clk100hz
);

Mux21 mux1(clk100hz, clk, reset, clk100hz2); //put in so reset occurs on a faster clock


SequencerII seq(

	clk100hz2, 
	reset,
	ctrl, //for user to change chord, not yet in use
	userInput2, //from arduino, for the variable clock length

	//input [3:0] count_in, //to test

	frequency0, //output from LUT (to go to memory)
	frequency1,
	frequency2,
	frequency3,
	frequency4,
	frequency5,
	frequency6,
	frequency7,
	frequency8,
	frequency9,
	frequency10,
	frequency11,
	frequency12,
	frequency13,
	frequency14,
	frequency15,
	
	Triggeradsr, //output to memory and adsr, note on/off
	Triggermem,
	
	end_count
	
);


FrequencyMemReg reg0 (

	frequency0,
	Triggermem[0],
	clk,
	memfrequency0

); 

FrequencyMemReg reg1 (

	frequency1,
	Triggermem[1],
	clk,
	memfrequency1

); 

FrequencyMemReg reg2 (

	frequency2,
	Triggermem[2],
	clk,
	memfrequency2

); 

FrequencyMemReg reg3 (

	frequency3,
	Triggermem[3],
	clk,
	memfrequency3

); 

FrequencyMemReg reg4 (

	frequency4,
	Triggermem[4],
	clk,
	memfrequency4

); 

FrequencyMemReg reg5 (

	frequency5,
	Triggermem[5],
	clk,
	memfrequency5

); 

FrequencyMemReg reg6 (

	frequency6,
	Triggermem[6],
	clk,
	memfrequency6

); 

FrequencyMemReg reg7 (

	frequency7,
	Triggermem[7],
	clk,
	memfrequency7

); 

FrequencyMemReg reg8 (

	frequency8,
	Triggermem[8],
	clk,
	memfrequency8

); 

FrequencyMemReg reg9 (

	frequency9,
	Triggermem[9],
	clk,
	memfrequency9

); 

FrequencyMemReg reg10 (

	frequency10,
	Triggermem[10],
	clk,
	memfrequency10

); 

FrequencyMemReg reg11 (

	frequency11,
	Triggermem[11],
	clk,
	memfrequency11

); 

FrequencyMemReg reg12 (

	frequency12,
	Triggermem[12],
	clk,
	memfrequency12

); 

FrequencyMemReg reg13 (

	frequency13,
	Triggermem[13],
	clk,
	memfrequency13

); 

FrequencyMemReg reg14 (

	frequency14,
	Triggermem[14],
	clk,
	memfrequency14

); 

FrequencyMemReg reg15 (

	frequency15,
	Triggermem[15],
	clk,
	memfrequency15

); 


always @ (clk) begin
		clk100hzout2 <= clk100hz2; //has a faster clock cycle when reset is on, so that modules reset faster
		//clk100hzout <=clk100hz; //just straight 100hz
end
	


endmodule