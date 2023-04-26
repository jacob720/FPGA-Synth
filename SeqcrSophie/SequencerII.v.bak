
//Sequencer top level hierachy 
//Sophie watson

module SequencerII(

	input clk100hz, 
	input reset,
	input [1:0] ctrl, //for user to change chord, not yet in use
	input [9:0] userInput, //from arduino, for the variable clock length

	//input [3:0] count_in, //to test

	output wire [19:0] frequency0, //output from LUT (to go to memory)
	output wire [19:0] frequency1,
	output wire [19:0] frequency2,
	output wire [19:0] frequency3,
	output wire [19:0] frequency4,
	output wire [19:0] frequency5,
	output wire [19:0] frequency6,
	output wire [19:0] frequency7,
	output wire [19:0] frequency8,
	output wire [19:0] frequency9,
	output wire [19:0] frequency10,
	output wire [19:0] frequency11,
	output wire [19:0] frequency12,
	output wire [19:0] frequency13,
	output wire [19:0] frequency14,
	output wire [19:0] frequency15,
	
	output wire [15:0] Triggeradsr, //output to memory and adsr, note on/off
	output wire [15:0] Triggermem,
	
	
	output wire end_count //from counter
	//output wire variableClk //to monitor
	//output wire [3:0] count_out //to monitor

);

wire [3:0] count;

wire [6:0] note0;
wire [6:0] note1; //output from chords to corresponding LUT
wire [6:0] note2;
wire [6:0] note3;
wire [6:0] note4;
wire [6:0] note5;
wire [6:0] note6;
wire [6:0] note7;
wire [6:0] note8;
wire [6:0] note9;
wire [6:0] note10;
wire [6:0] note11;
wire [6:0] note12;
wire [6:0] note13;
wire [6:0] note14;
wire [6:0] note15;

wire VariableClk2; //from mux to modules
wire variableClk;

 //from v clk to count and trigger 


VariableClkSeq vclk(

	clk100hz,
   userInput,
   variableClk
);

Mux21 mux1(variableClk, clk100hz, reset, VariableClk2); //put in so reset occurs on a faster clock

Counter_4bitSW count1( //my slightly adapted counter
	VariableClk2, //variable clk input
	reset,
	count,
	end_count
);


Chords chords1(
	VariableClk2,
	reset,
	ctrl,
	note0,
	note1,
	note2,
	note3,
	note4,
	note5,
	note6,
	note7,
	note8,
	note9,
	note10,
	note11,
	note12,
	note13,
	note14,
	note15
	
);

FreqLookup LUT0(note0, frequency0);

FreqLookup LUT1(note1, frequency1);

FreqLookup LUT2(note2, frequency2);

FreqLookup LUT3(note3, frequency3);

FreqLookup LUT4(note4, frequency4);

FreqLookup LUT5(note5, frequency5);

FreqLookup LUT6(note6, frequency6);

FreqLookup LUT7(note7, frequency7);

FreqLookup LUT8(note8, frequency8);

FreqLookup LUT9(note9, frequency9);

FreqLookup LUT10(note10, frequency10);

FreqLookup LUT11(note11, frequency11);

FreqLookup LUT12(note12, frequency12);

FreqLookup LUT13(note13, frequency13);

FreqLookup LUT14(note14, frequency14);

FreqLookup LUT15(note15, frequency15);


noteTrigger noteTrigMem(

	VariableClk2,
	count,
	Triggermem

);

noteTrigger noteTrigadsr(

	VariableClk2,
	count,
	Triggeradsr

);

endmodule