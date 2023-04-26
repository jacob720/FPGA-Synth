  module SynthTopLevel(
	input RESET,
	input CLOCK50M,
	input InitialiseTransfer,
	input NoteOn,	//for Jane's ADSR, pin PIN_Y24
	input [15:0] message,
	
	output SCLK,	//I2C clock line
	output SDIN,	//I2C data line
	
	output MCLK,		//WM8731 masterClock (default: )
	
	output BCLK,		//I2S clock
	output DACLRC,		//I2S left/right select (0 = left, 1 = right; 0 goes first)
	output DACDAT,		//I2S data line
	
	output [19:0] SRAMaddress, //see DE2-115 manual page 67-68
	output SRAM_nCE, 	//PIN_AF8 - Chip Enable Input (negative logic)
	output SRAM_nOE, 	//PIN_AD5 - Output Enable Input (negative logic)
	output SRAM_nWE,	//PIN_AE8 - Write Enable (negative logic)
	output SRAM_nUB,	//PIN_AC4 - Upper-byte Control (I/O8-I/O15)	
	output SRAM_nLB,	//PIN_AD4 - Lower-byte Control (I/O0-I/O7)
	
	inout [15:0] SRAMdata //see DE2-115 manual page 67-68
	);

//audio path and oscillator frequency wires
wire [19:0] freq;
reg EffectsBypass;
wire [19:0] AudioLeftOsc;
wire [19:0] AudioLeftADSR;
wire [19:0] AudioLeft2sCompl;
wire [19:0] AudioLeftFilter;
wire [19:0] AudioLeftReverb;
wire [19:0] AudioLeftEffects;


//timers: we need:
// - Fsampling of 48kHz
//	- MCLK of 12.288Mhz
//	- TESTPulse of 500Hz
// - we need at leat 3MHz for audio samples send (but can use 12.288 really)
wire CLOCK196MHz;
wire CLOCK12MHz;
wire CLOCK48kHz;
wire [1:0] PLLlocked;
wire PROTOBCLK;
wire PROTOaudio;
wire [17:0] CLOCKdivCount;

//SOPHIE's PLL for MIKO
wire LOCKED_PLL196K;
wire RESET_PLL196K;
assign RESET_PLL196K = RESET;
//
//PLL196M PLL196M_1(
//	RESET,
//	CLOCK50M,
//	CLOCK196MHz,
//	MCLK,
//	CLOCK48kHz,
//	LOCKED_PLL196K);

//BCLK is precisely 128 times faster than CLOCK48kHz
//PLL12M6M48k PLLfor12Mand6Mand48k(RESET, CLOCK50M, MCLK, BCLK, CLOCK48kHz, PLLlocked[0]); //12.288Mhz and 48kHz PLL
//12.288 MHz counter with counter as a clock divider
PLL12M PLL12MHz(aRESET, CLOCK50M, MCLK, PLLlocked[0]);
Counter18bit ClockDivider(MCLK, RESET, CLOCKdivCount);
//assign MCLK = CLOCK12MHz;
assign BCLK = MCLK;
assign CLOCK48kHz = CLOCKdivCount[7];
//assign DACLRC = CLOCK48kHz;


//pll that generates square w
//PLL5M1600 PLLfor5Mand1600(RESET, CLOCK50M, PROTOBCLK, PROTOaudio, PLLlocked[1]); //BCLK = 5Mhz and 1600 PLL
//Sophie Control Unit

wire CLOCKseqCU; //sequencer clock from Contol Unit
wire SeqEnable;
wire CU_RESET;
wire aRESET;
wire waveform_CU;
wire detune_CU;

CUSW ControlUnit(

	CLOCK50M,
	MCLK,
	PLLlocked[0], //PLL locked signal
	RESET,
	~RESET, //negative reset
	//P0A, P1A, P2A, P3A, P4A, P5A, P6A, P7A, //user potentiometers from arduino
	10'h0A0, 10'h0A0, 10'h0A0, 10'h0A0, 10'h0A0, 10'h0A0, 10'h0A0, 10'h0A0, //user potentiometers from arduino
	//E0A, E1A, E2A, E3A, E4A, E5A, E6A, E7A, //enable buttons for modules
	1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, //enable buttons for modules
	
	//numbers correlate to reg number, bank number - preassigned have code
	CLOCKseqCU, //variable clock for sequencer
	SeqEnable, // E0
	
	//output reg [9:0] Osc01, //waveform 
	waveform_CU,
	//output reg [9:0] Osc11, //detune
	detune_CU,
	Osc21,
	Osc31,
	Osc41,
	Osc51,
	Osc61,
	
	ADSREnable, // E2
	ADSR02, //attack 
	ADSR12, //decay
	ADSR32, //sustain
	ADSR42, //release
	
	
	//output reg [9:0] Fltr03, //filter control
	filterSel, //2 bit control
	//output reg [9:0] Fltr13, //cut-off sel
	cuttoff, //0-2
	Fltr23,
	Fltr33,
	Fltr43,
	Fltr53,
	Fltr63,
	
	Efct04,
	Efct14,
   Efct24,
	Efct34,
	Efct44,
	Efct54,
	Efct64,
	
	E05,
	E15,
	E25,
	E35,
	E45,
	E55,
	E65,
	
	E06,
	E16,
	E26,
	E36,
	E46,
	E56,
	E66,
	
	aRESET, //for the PLL
	CU_RESET, //active hive reset
	CU_RESET_N, //active low reset
	volume2DAC, //the volume to go to the DAC
	volchange, //if the voltage changes, sends a pulse to the DAC
	DAC_RESET_out, //reset for the DAC
	DACpulseTrigger, //trigger for the DAC restart process
	readyFlag //ready flag for the arduino
	
);

//SOPHIE Sequencer

	wire [19:0] memfrequency0; //output from memory (to go to osc)
	wire [19:0] memfrequency1;
	wire [19:0] memfrequency2;
	wire [19:0] memfrequency3;
	wire [19:0] memfrequency4;
	wire [19:0] memfrequency5;
	wire [19:0] memfrequency6;
	wire [19:0] memfrequency7;
	wire [19:0] memfrequency8;
	wire [19:0] memfrequency9;
	wire [19:0] memfrequency10;
	wire [19:0] memfrequency11;
	wire [19:0] memfrequency12;
	wire [19:0] memfrequency13;
	wire [19:0] memfrequency14;
	wire [19:0] memfrequency15;
	wire [15:0] Triggeradsr;
	wire end_count;
	wire clk100hzout2;
	

Sophie2Osc( CLOCK50M, //system 50mhz clk
	CU_RESET, //active high
	2'b00 , //for user to change chord, not yet in use
	CLOCKseqCU, //from arduino, for the variable clock length
	SeqEnable, //for the mem reg containing user input, stops user from chagning all parameters

	//input [3:0] count_in, //to test

	memfrequency0, //output from memory (to go to osc)
	memfrequency1,
	memfrequency2,
	memfrequency3,
	memfrequency4,
	memfrequency5,
	memfrequency6,
	memfrequency7,
	memfrequency8,
	memfrequency9,
	memfrequency10,
	memfrequency11,
	memfrequency12,
	memfrequency13,
	memfrequency14,
	memfrequency15,
	
	Triggeradsr, //output to adsr, note on/off
	
	
	end_count, //end of osc run (16)
	clk100hzout2//special sophie clk - need an always clause at the bottom - going to adsr clock 
	//change to a reg for the always block

);


//JACOB Oscillator

	wire [15:0] wave0;
	wire [15:0] wave1;
	wire [15:0] wave2;
	wire [15:0] wave3;
	wire [15:0] wave4;
	wire [15:0] wave5;
	wire [15:0] wave6;
	wire [15:0] wave7;
	wire [15:0] wave8;
	wire [15:0] wave9;
	wire [15:0] wave10;
	wire [15:0] wave11;
	wire [15:0] wave12;
	wire [15:0] wave13;
	wire [15:0] wave14;
	wire [15:0] wave15;
	
	wire [15:0] wave0ADSR;
	wire [15:0] wave1ADSR;
	wire [15:0] wave2ADSR;
	wire [15:0] wave3ADSR;
	wire [15:0] wave4ADSR;
	wire [15:0] wave5ADSR;
	wire [15:0] wave6ADSR;
	wire [15:0] wave7ADSR;
	wire [15:0] wave8ADSR;
	wire [15:0] wave9ADSR;
	wire [15:0] wave10ADSR;
	wire [15:0] wave11ADSR;
	wire [15:0] wave12ADSR;
	wire [15:0] wave13ADSR;
	wire [15:0] wave14ADSR;
	wire [15:0] wave15ADSR;


JacobTopLevel Oscillators( CLOCK48kHz, RESET, waveform_CU, detune_CU,
	memfrequency0,
	memfrequency1,
	memfrequency2,
	memfrequency3,
	memfrequency4,
	memfrequency5,
	memfrequency6,
	memfrequency7,
	memfrequency8,
	memfrequency9,
	memfrequency10,
	memfrequency11,
	memfrequency12,
	memfrequency13,
	memfrequency14,
	memfrequency15,
//	20'h00C40,
//	20'h00C40,
//	20'h00C40,
//	20'h00C40,
//	20'h00C40,
//	20'h00C40,
//	20'h00C40,
//	20'h00C40,
//	20'h00C40,
//	20'h00C40,
//	20'h00C40,
//	20'h00C40,
//	20'h00C40,
//	20'h00C40,
//	20'h00C40,
//	20'h00C40,
	
	wave0,
	wave1,
	wave2,
	wave3,
	wave4,
	wave5,
	wave6,
	wave7,
	wave8,
	wave9,
	wave10,
	wave11,
	wave12,
	wave13,
	wave14,
	wave15
);

//SOPHIE ADSR CONTROL
reg [9:0] POT0;
reg [9:0] POT1;
reg [9:0] POT2;
reg [9:0] POT3;

wire CLOCK_ATTACK;
wire CLOCK_DECAY;
wire [3:0] SUSTAIN;
wire CLOCK_RELEASE;
	
ADSRClockDiv ADSR_CLOCKDIV(
	10'd000,
	10'd000,
	10'd000,
	10'd000, 
	message[14], //ENABLE = user switch - load to DFF
	RESET, //for 50-100hz clk currently
	CLOCK50M,
	CLOCK_ATTACK, //0 or 1
	CLOCK_DECAY, //0 or 1
	SUSTAIN, // between 2-12
	CLOCK_RELEASE //0 or 1
);
//JANE ADSR
//JaneTopLevel ADSR_TL( CLOCK12M, CLOCK48kHz, CLOCKdivCount[17], CLOCKdivCount[17], CLOCKdivCount[17], RESET, NoteOn, AudioLeftOsc, AudioLeftADSR );
JaneTopLevel ADSR_TL( CLOCK12MHz, CLOCK48kHz, CLOCKdivCount[17], CLOCKdivCount[17], CLOCKdivCount[17], RESET, Triggeradsr,
	wave0,
	wave1,
	wave2,
	wave3,
	wave4,
	wave5,
	wave6,
	wave7,
	wave8,
	wave9,
	wave10,
	wave11,
	wave12,
	wave13,
	wave14,
	wave15,
	
	wave0ADSR,
	wave1ADSR,
	wave2ADSR,
	wave3ADSR,
	wave4ADSR,
	wave5ADSR,
	wave6ADSR,
	wave7ADSR,
	wave8ADSR,
	wave9ADSR,
	wave10ADSR,
	wave11ADSR,
	wave12ADSR,
	wave13ADSR,
	wave14ADSR,
	wave15ADSR
);


//JACOB Mixer of ADSRd waves
Mixer16 mixer(
	CLOCK48kHz,
	wave0ADSR,
	wave1ADSR,
	wave2ADSR,
	wave3ADSR,
	wave4ADSR,
	wave5ADSR,
	wave6ADSR,
	wave7ADSR,
	wave8ADSR,
	wave9ADSR,
	wave10ADSR,
	wave11ADSR,
	wave12ADSR,
	wave13ADSR,
	wave14ADSR,
	wave15ADSR,
	AudioLeftADSR
);

//convert to 2s complement for easier send
UnsignedTo2sCompl20Bit UnsTo2sCompl( AudioLeftADSR, AudioLeft2sCompl);

//Jane Filter
FilterTopLevel filt(CLOCK48kHz,AudioLeft2sCompl, AudioLeftFilter);
BYPASSeffects BPfilter(message[15], AudioLeftFilter, AudioLeft2sCompl, AudioLeftEffects );


//MIKO Reverb OR delay
//ReverbShroeder1 RVRB( RESET, CLOCK48kHz, AudioLeft2sCompl, AudioLeftReverb );

Delay1Tap DLY( RESET,
	CLOCK48KHz,
	CLOCK12MHz,
	AudioLeft2sCompl, //20 bit audio input
	
	SRAMaddress, //see DE2-115 manual page 67-68
	AudioLeftReverb,	//20 bit audio output
	SRAM_nCE, 	//PIN_AF8 - Chip Enable Input (negative logic)
	SRAM_nOE, 	//PIN_AD5 - Output Enable Input (negative logic)
	SRAM_nWE,	//PIN_AE8 - Write Enable (negative logic)
	SRAM_nUB,	//PIN_AC4 - Upper-byte Control (I/O8-I/O15)	
	SRAM_nLB,	//PIN_AD4 - Lower-byte Control (I/O0-I/O7)
	
	SRAMdata
);



//MIKO bypass effects section
//BYPASSeffects effects(message[15], AudioLeftReverb, AudioLeft2sCompl, AudioLeftEffects );

//MIKO
//I2SAudioSend constantly sending audio at WM8731
//I2SAudioSend AudioToDAC(BCLK, CLOCK48kHz, (message[15]&AudioLeftReverb)|(!message[15]&AudioLeftADSR), DACLRC, DACDAT);
I2SAudioSend AudioToDAC(BCLK, CLOCK48kHz, AudioLeftEffects, DACLRC, DACDAT);

//I2C message write
I2CMasterV3 I2CMaster( RESET, CLOCK50M, InitialiseTransfer, message, SCLK, SDIN);
endmodule
