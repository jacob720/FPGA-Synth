//all of the CU pieces under one roof
//fuck it lets go


module CUSW (

	input clk50Mhz,
	input clk12Mhz,
	input locked, //PLL locked signal
	input RESET,
	input RESET_N, //negative reset
	input [9:0] P0A, P1A, P2A, P3A, P4A, P5A, P6A, P7A, //user potentiometers from arduino
	input E0A, E1A, E2A, E3A, E4A, E5A, E6A, E7A, //enable buttons for modules
	
	//numbers correlate to reg number, bank number - preassigned have code
	output reg [9:0] Seq00, //variable clock input
	output reg SeqEnable, // E0
	
	//output reg [9:0] Osc01, //waveform 
	output wire [1:0] waveform,
	//output reg [9:0] Osc11, //detune
	output wire [3:0] detune,
	output wire [9:0] Osc21,
	output wire [9:0] Osc31,
	output wire [9:0] Osc41,
	output wire [9:0] Osc51,
	output wire [9:0] Osc61,
	
	output reg ADSREnable, // E2
	output reg [9:0] ADSR02, //attack 
	output reg [9:0] ADSR12, //decay
	output reg [9:0] ADSR32, //sustain
	output reg [9:0] ADSR42, //release
	
	
	//output reg [9:0] Fltr03, //filter control
	output wire [1:0] filterSel, //2 bit control
	//output reg [9:0] Fltr13, //cut-off sel
	output wire [1:0] cuttoff, //0-2
	output wire [9:0] Fltr23,
	output wire [9:0] Fltr33,
	output wire [9:0] Fltr43,
	output wire [9:0] Fltr53,
	output wire [9:0] Fltr63,
	
	output wire [9:0] Efct04,
	output wire [9:0] Efct14,
	output wire [9:0] Efct24,
	output wire [9:0] Efct34,
	output wire [9:0] Efct44,
	output wire [9:0] Efct54,
	output wire [9:0] Efct64,
	
	output wire [9:0] E05,
	output wire [9:0] E15,
	output wire [9:0] E25,
	output wire [9:0] E35,
	output wire [9:0] E45,
	output wire [9:0] E55,
	output wire [9:0] E65,
	
	output wire [9:0] E06,
	output wire [9:0] E16,
	output wire [9:0] E26,
	output wire [9:0] E36,
	output wire [9:0] E46,
	output wire [9:0] E56,
	output wire [9:0] E66,
	
	output wire areset, //for the PLL
	output wire CU_RESET, //active live reset
	output wire CU_RESET_N, //active low reset
	output wire [6:0] volume2DAC, //the volume to go to the DAC
	output wire volchange, //if the voltage changes, sends a pulse to the DAC
	output wire DAC_RESET_out, //reset for the DAC
	output wire DACpulseTrigger, //trigger for the DAC restart process
	output wire readyFlag
	
	
);

wire reset; //from the reset module
wire reset_n;

wire DACReadyFlag;
//to connect to the input conversion modules
wire [9:0] Osc01Wire;
wire [9:0] Osc11Wire;
wire [9:0] Fltr03Wire;
wire [9:0] Fltr13Wire;

wire [9:0] P0; 
wire [9:0] P1; 
wire [9:0] P2; 
wire [9:0] P3; 
wire [9:0] P4; 
wire [9:0] P5; 
wire [9:0] P6; 
wire [9:0] P7; //user potentiometers from open regs
wire E0; 
wire E1; 
wire E2; 
wire E3; 
wire E4; 
wire E5;
wire E6; 
wire E7; //enable buttons for modules from DFF


wire [6:0] basevolume; //for the dac, base volume
wire reset_enable;
wire E0N; //enable pins ORed with the reset enable, so that all values can be reloaded after shutdown
wire E1N;
wire E2N;
wire E3N;
wire E4N;
wire E5N;
wire E6N;

or orreset(CU_RESET, reset, RESET); //reset is from reset module, RESET is switch FPGA input
nand nandresetn(CU_RESET_N, reset_n, RESET_N);//reset_n is from reset module, RESET_N is a switch FPGA input



//open registers for the pots for the arduino input
FrequencyMemReg p0m( P0A, 1'b1, clk50Mhz, P0 ); 
FrequencyMemReg p1m( P1A, 1'b1, clk50Mhz, P1 );
FrequencyMemReg p2m( P2A, 1'b1, clk50Mhz, P2 );
FrequencyMemReg p3m( P3A, 1'b1, clk50Mhz, P3 );
FrequencyMemReg p4m( P4A, 1'b1, clk50Mhz, P4 );
FrequencyMemReg p5m( P5A, 1'b1, clk50Mhz, P5 );
FrequencyMemReg p6m( P6A, 1'b1, clk50Mhz, P6 );
FrequencyMemReg p7m( P7A, 1'b1, clk50Mhz, P7 );

//open one bit for the enable for the arduino

OneBitReg Reg0( E0A, 1'b1, clk50Mhz, E0);
OneBitReg Reg1( E1A, 1'b1, clk50Mhz, E1);
OneBitReg Reg2( E2A, 1'b1, clk50Mhz, E2);
OneBitReg Reg3( E3A, 1'b1, clk50Mhz, E3);
OneBitReg Reg4( E4A, 1'b1, clk50Mhz, E4);
OneBitReg Reg5( E5A, 1'b1, clk50Mhz, E5);
OneBitReg Reg6( E6A, 1'b1, clk50Mhz, E6);
OneBitReg Reg7( E7A, 1'b1, clk50Mhz, E7);






variableInputRegisters memreg1(
	//inputs:
	clk50Mhz, //50mhz clk
	P0, P1, P2, P3, P4, P5, P6, //all the potentiometer user inputs except vol
	//input E0 = seq input E2 = filter
	E1N, //osc
	E3N, //filter
	E4N, //effects
	E5N, //spare
	E6N, //spare
	//Outputs:
	//seq00 - in module 
	Osc01Wire, Osc11Wire, Osc21, Osc31, Osc41, Osc51, Osc61,
	//adsr02 - in module
	Fltr03Wire, Fltr13Wire, Fltr23, Fltr33, Fltr43, Fltr53, Fltr63, 
	Efct04, Efct14, Efct24, Efct34, Efct44, Efct54, Efct64,
	E05, E15, E25, E35, E45, E55, E65, E06, E16, E26, E36, E46, E56, E66 //spare registers
);

	oscInput oscin(
	
	clk50Mhz, //50mhz is fine
	Osc01Wire, //user pot in 0
	Osc11Wire, //user pot in 1
	
	waveform, //2 bit control
	detune //4 bit control
	
);

	fltrInput fltrin(
	
	clk50Mhz, //50mhz is fine
	Fltr03Wire, //user pot in 0
	Fltr13Wire, //user pot in 1
	
	filterSel, //2 bit control
	cuttoff //0-2
	
);

ResetModuleSW reset1(

	clk50Mhz, //50mhz on board system clock
	locked, //locked PLL signal
	DACReadyFlag, //DAC reset
	
	basevolume, //for the dac
	
	areset, //for the PLL

	reset_enable, //for pot values
	reset, //active hive reset
	reset_n, //active low reset
	readyFlag //ready flag for the arduino

);




//(out, a,b)
or or0 ( E0N, E0, reset_enable);
or or1 ( E1N, E1, reset_enable);
or or2 ( E2N, E2, reset_enable);
or or3 ( E3N, E3, reset_enable);
or or4 ( E4N, E4, reset_enable);
or or5 ( E5N, E5, reset_enable);
or or6 ( E6N, E6, reset_enable);
//E7 is not enable, its potentially shut down, so not here


volumeControl vc1(

	clk50Mhz, //50mhz
	basevolume, //volume as entered by the reset function - either 0 or -73db - 
	P7, //user input from arduino, between 0-1023
	
	volume2DAC,
	volchange //would use the negedge as this means that the volume has stopped changing
);

DACreset DACreset1(

	CU_RESET,
	clk12Mhz,
	DAC_RESET_out, 
	DACpulseTrigger,
	DACReadyFlag

);

always @ (posedge clk50Mhz)
	
	begin
		
		//assigning for the sequencer module
		Seq00 = P0;
		SeqEnable = E0N; 
		
		//assigning for the adsr module
		
		
		ADSR02 = P0; //attack 
		ADSR12 = P1; //decay
		ADSR32 = P2; //sustain
		ADSR42 = P3; //release
		ADSREnable = E2N;		
			
		
	end


endmodule

