//the input memory banks for any user variables within the project 
//- each module has 7 possible registers to store values
//Sophie watson



module variableInputRegisters (

	input clk, //50mhz clk
	input [9:0] P0, //all the potentiometer user inputs
	input [9:0] P1,
	input [9:0] P2,
	input [9:0] P3,
	input [9:0] P4,
	input [9:0] P5,
	input [9:0] P6,
	
	//input E0, //seq
	input E1, //osc
	//input E2, //adsr
	input E3, //filter
	input E4, //effects
	input E5, //spare
	input E6, //spare
	
	//seq00 - in module 
	output [9:0] Osc01, //numbers correlate to reg number, bank number - preassigned have code
	output [9:0] Osc11,
	output [9:0] Osc21,
	output [9:0] Osc31,
	output [9:0] Osc41,
	output [9:0] Osc51,
	output [9:0] Osc61,
	//adsr02 - in module
	output [9:0] Fltr03,
	output [9:0] Fltr13,
	output [9:0] Fltr23,
	output [9:0] Fltr33,
	output [9:0] Fltr43,
	output [9:0] Fltr53,
	output [9:0] Fltr63,
	output [9:0] Efct04,
	output [9:0] Efct14,
	output [9:0] Efct24,
	output [9:0] Efct34,
	output [9:0] Efct44,
	output [9:0] Efct54,
	output [9:0] Efct64,
	output [9:0] E05,
	output [9:0] E15,
	output [9:0] E25,
	output [9:0] E35,
	output [9:0] E45,
	output [9:0] E55,
	output [9:0] E65,
	output [9:0] E06,
	output [9:0] E16,
	output [9:0] E26,
	output [9:0] E36,
	output [9:0] E46,
	output [9:0] E56,
	output [9:0] E66

	

);




wire [19:0] reg0;
wire [19:0] reg1;
wire [19:0] reg2;
wire [19:0] reg3;
wire [19:0] reg4;
wire [19:0] reg5;
wire [19:0] reg6;

//freqreg(in,load,clk,out)
// pot register - 6 intial registers, load always open, to get the data coming in from the arduino
FrequencyMemReg regg0( P0, 1'b1, clk, reg0 );

FrequencyMemReg regg1( P1, 1'b1, clk, reg1 );

FrequencyMemReg regg2( P2, 1'b1, clk, reg2 );

FrequencyMemReg regg3( P3, 1'b1, clk, reg3 );

FrequencyMemReg regg4( P4, 1'b1, clk, reg4 );

FrequencyMemReg regg5( P5, 1'b1, clk, reg5 );

FrequencyMemReg regg6( P6, 1'b1, clk, reg6 );


//osc

FrequencyMemReg osc0( reg0, E1, clk, Osc01 );
FrequencyMemReg osc1( reg1, E1, clk, Osc11 );
FrequencyMemReg osc2( reg2, E1, clk, Osc21 );
FrequencyMemReg osc3( reg3, E1, clk, Osc31 );
FrequencyMemReg osc4( reg4, E1, clk, Osc41 );
FrequencyMemReg osc5( reg5, E1, clk, Osc51 );
FrequencyMemReg osc6( reg6, E1, clk, Osc61 );

//filter
FrequencyMemReg fltr0( reg0, E3, clk, Fltr03 );
FrequencyMemReg fltr1( reg1, E3, clk, Fltr13 );
FrequencyMemReg fltr2( reg2, E3, clk, Fltr23 );
FrequencyMemReg fltr3( reg3, E3, clk, Fltr33 );
FrequencyMemReg fltr4( reg4, E3, clk, Fltr43 );
FrequencyMemReg fltr5( reg5, E3, clk, Fltr53 );
FrequencyMemReg fltr6( reg6, E3, clk, Fltr63 );

//effects 

FrequencyMemReg efct0( reg0, E4, clk, Efct04 );
FrequencyMemReg efct1( reg1, E4, clk, Efct14 );
FrequencyMemReg efct2( reg2, E4, clk, Efct24 );
FrequencyMemReg efct3( reg3, E4, clk, Efct34 );
FrequencyMemReg efct4( reg4, E4, clk, Efct44 );
FrequencyMemReg efct5( reg5, E4, clk, Efct54 );
FrequencyMemReg efct6( reg6, E4, clk, Efct64 );

//E5 - spare

FrequencyMemReg e50( reg0, E5, clk, E05 );
FrequencyMemReg e51( reg1, E5, clk, E15 );
FrequencyMemReg e52( reg2, E5, clk, E25 );
FrequencyMemReg e53( reg3, E5, clk, E35 );
FrequencyMemReg e54( reg4, E5, clk, E45 );
FrequencyMemReg e55( reg5, E5, clk, E55 );
FrequencyMemReg e56( reg6, E5, clk, E65 );

FrequencyMemReg e60( reg0, E6, clk, E06 );
FrequencyMemReg e61( reg1, E6, clk, E16 );
FrequencyMemReg e62( reg2, E6, clk, E26 );
FrequencyMemReg e63( reg3, E6, clk, E36 );
FrequencyMemReg e64( reg4, E6, clk, E46 );
FrequencyMemReg e65( reg5, E6, clk, E56 );
FrequencyMemReg e66( reg6, E6, clk, E66 );


//do others


endmodule



