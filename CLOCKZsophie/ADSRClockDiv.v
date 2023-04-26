//ADSR clock divider 
//needs to store the values from the potentiometer DFF - in a second DFF, so that when load (enable) isnt flicked, the number does not change
//that number needs to afect the clock amount
//so if the range is 0-1024, and we need a 10s range - so dividing by 100 would be good enough
//enable 
//clocks into the ADR variable clk modules is the 50mhz as a test - need to change, and need to get 100hz running

module ADSRClockDiv (

	input [9:0] POT0,
	input [9:0] POT1,
	input [9:0] POT2,
	input [9:0] POT3,
	input ENABLE, //user switch - load to DFF
	input Reset, //for 50-100hz clk currently
	//input clk100hz,
	input clk50Mhz,
	output wire OUT_A, //0 or 1
	output wire OUT_D, //0 or 1
	output wire [3:0] OUT_S, // between 2-12
	output wire OUT_R //0 or 1
);

//clock 5sec attack

wire [9:0] DA; //from reg to variable clk
wire [9:0] DD;
wire [9:0] DS;
wire [9:0] DR;
wire [9:0] A; //from 
wire [9:0] D;
wire [9:0] S;
wire [9:0] R;

wire clk100hz;


ClockDivider50MHzTo100Hz clkDiv( //clk to the variable clks
	clk50Mhz,
	Reset,
	clk100hz	
);

 
FrequencyMemReg RegA(
	POT0, //[19:0] IN, so we arent using all of the bits
	ENABLE, //load
	clk50Mhz, //clk
	DA //out, [19:0] so we arent using all of the bits
);

FrequencyMemReg RegD(
	POT1,
	ENABLE,
	clk50Mhz,
	DD
);

FrequencyMemReg RegS(
	POT2,
	ENABLE,
	clk50Mhz,
	DS
);

FrequencyMemReg RegR(
	POT3,
	ENABLE,
	clk50Mhz,
	DR
);

VariableClkFiveSec AttackVariableClk (

	clk100hz,
	DA,
	OUT_A
);



//clock 3sec decay
VariableClkThreeSec DecayVariableClk (

	clk100hz,
	DD,
	OUT_D
);


//sustain out

SustainVariable SustainValue (

   DS, //for some reason this is in a different order, but its user input
   clk50Mhz, //clk
   OUT_S //out
);

//clock 5 release

VariableClkFiveSec ReleaseVariableClk (

	clk100hz,
	DR,
	OUT_R
);

endmodule
