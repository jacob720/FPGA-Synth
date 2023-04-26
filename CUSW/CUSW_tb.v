//CUSW test module - this is going to be absolutely fucking impossible to deciefer but
//i guess we'll fucking try
//sophie watson
//testbench to show as many outputs as possible

`timescale 1 ns/100 ps
	
module CUSW_tb;


	reg clk50Mhz;
	reg clk12Mhz;
	reg locked; //PLL locked signal
	reg RESET;
	reg RESET_N; //negative reset
	reg [9:0] P0A; 
	reg [9:0] P1A;
	reg [9:0] P2A;
	reg [9:0] P3A;
	reg [9:0] P4A;
	reg [9:0] P5A;
	reg [9:0] P6A;
	reg [9:0] P7A; //user potentiometers from arduino
	
	reg E0A;
	reg E1A;
 	reg E2A;
 	reg E3A;
 	reg E4A;
	reg E5A;
	reg E6A;
	reg E7A; //enable buttons for modules
	
	//numbers correlate to reg number, bank number - preassigned have code
	wire [9:0] Seq00; //variable clock input
	wire SeqEnable; // E0
	
	//output reg [9:0] Osc01, //waveform 
	wire [1:0] waveform;
	//output reg [9:0] Osc11, //detune
	wire [3:0] detune;
	wire [9:0] Osc21;
	wire [9:0] Osc31;
	wire [9:0] Osc41;
	wire [9:0] Osc51;
	wire [9:0] Osc61;
	
	wire ADSREnable; // E2
	wire [9:0] ADSR02; //attack 
	wire [9:0] ADSR12; //decay
	wire [9:0] ADSR32; //sustain
	wire [9:0] ADSR42; //release
	
	
	//output reg [9:0] Fltr03, //filter control
	wire [1:0] filterSel; //2 bit control
	//output reg [9:0] Fltr13, //cut-off sel
	wire [1:0] cuttoff; //0-2
	wire [9:0] Fltr23;
	wire [9:0] Fltr33;
	wire [9:0] Fltr43;
	wire [9:0] Fltr53;
	wire [9:0] Fltr63;
	
	wire [9:0] Efct04;
	wire [9:0] Efct14;
	wire [9:0] Efct24;
	wire [9:0] Efct34;
	wire [9:0] Efct44;
	wire [9:0] Efct54;
	wire [9:0] Efct64;
	
	wire [9:0] E05;
	wire [9:0] E15;
	wire [9:0] E25;
	wire [9:0] E35;
	wire [9:0] E45;
	wire [9:0] E55;
	wire [9:0] E65;
	
	wire [9:0] E06;
	wire [9:0] E16;
	wire [9:0] E26;
	wire [9:0] E36;
	wire [9:0] E46;
	wire [9:0] E56;
	wire [9:0] E66;
	
	wire areset; //for the PLL
	wire CU_RESET; //active hive reset
	wire CU_RESET_N; //active low reset
	wire [6:0] volume2DAC; //the volume to go to the DAC
	wire volchange; //if the voltage changes, sends a pulse to the DAC
	wire DAC_RESET_out; //reset for the DAC
	wire DACpulseTrigger; //trigger for the DAC restart process
	wire readyFlag; //ready flag for the arduino



	CUSW dut(

	 clk50Mhz,
	 clk12Mhz,
	 locked, //PLL locked signal
	 RESET,
	 RESET_N, //negative reset
	 P0A, P1A, P2A, P3A, P4A, P5A, P6A, P7A, //user potentiometers from arduino
	 E0A, E1A, E2A, E3A, E4A, E5A, E6A, E7A, //enable buttons for modules
	
	//numbers correlate to reg number, bank number - preassigned have code
	 Seq00, //variable clock input
	 SeqEnable, // E0
	
	//output reg [9:0] Osc01, //waveform 
	 waveform,
	//output reg [9:0] Osc11, //detune
	 detune,
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
	
	 areset, //for the PLL
	 CU_RESET, //active hive reset
	 CU_RESET_N, //active low reset
	 volume2DAC, //the volume to go to the DAC
	 volchange, //if the voltage changes, sends a pulse to the DAC
	 DAC_RESET_out, //reset for the DAC
	 DACpulseTrigger, //trigger for the DAC restart process
	 readyFlag //ready flag for the arduino
	
);
	

always begin

		#1;
		clk12Mhz = ~clk12Mhz;
		clk50Mhz = ~clk50Mhz;
		#1;
		clk50Mhz = ~clk50Mhz;
		#1;
		clk50Mhz = ~clk50Mhz;
		#1;
		clk50Mhz = ~clk50Mhz;
		#1;
		clk50Mhz = ~clk50Mhz;
		
end 

integer i = 0;

initial begin 

		clk12Mhz = 1'b0;
		clk50Mhz = 1'b0;
		RESET = 1'b0;
	   RESET_N = 1'b1; //negative reset
		
		P0A = 10'b1; //all the potentiometer user inputs - testing only selected changes
		P1A = 10'b11;
		P2A = 10'b111;
		P3A = 10'b1111;
		P4A = 10'b11111;
		P5A = 10'b111111;
		P6A = 10'b1111111;
		P7A = 10'b11111111;
		E0A = 0;
		E1A = 0;
		E2A = 0;
		E3A = 0;
		E4A = 0;
		E5A = 0;
		E6A = 0;
		E7A = 0;
		//should load intial values by enable in reset
		
		#300; //delay to clearly show it waits for locking
		
		locked = 1'b1; //simulating the PLL
		
		#3000; //simulating the time for intial changes before the volume is raised
		//user should not edit pots before the volume is raised
		
		 //seq
		 
		E0A = 1'b1;
		
		for (i = 0; i<1024; i = i +1) begin
	
		P0A = i; //all the potentiometer user inputs - testing only selected changes
		P1A = i;
		P2A = i;
		P3A = i;
		P4A = i;
		P5A = i;
		P6A = i;
		
		#15;
		
		end
		
		#100;
		
		E0A = 1'b0;
		E1A = 1'b1; // osc
		
		for (i = 0; i<1024; i = i +1) begin
	
		P0A = i; //all the potentiometer user inputs - testing only selected changes
		P1A = i;
		P2A = i;
		P3A = i;
		P4A = i;
		P5A = i;
		P6A = i;
		
		#15;
		
		end
		
		#100;
		
		E1A = 1'b0;
		E2A = 1'b1; // ADSR
		
		for (i = 0; i<1024; i = i +1) begin
	
		P0A = i; //all the potentiometer user inputs - testing only selected changes
		P1A = i;
		P2A = i;
		P3A = i;
		P4A = i;  //shouldnt change anything
		P5A = i;	//shouldnt change anything
		P6A = i;	//shouldnt change anything
		
		#15;
		
		end
		
		#100;
		
		E2A = 1'b0;
		E3A = 1'b1; // filter
		
		for (i = 0; i<1024; i = i +1) begin
	
		P0A = i; //all the potentiometer user inputs - testing only selected changes
		P1A = i;
		P2A = i;
		P3A = i;
		P4A = i;
		P5A = i;
		P6A = i;
		
		#15;
		
		end
		
		#100;
		
		E3A = 1'b0;
		E4A = 1'b1; // effects
		
		for (i = 0; i<1024; i = i +1) begin
	
		P0A = i; //all the potentiometer user inputs - testing only selected changes
		P1A = i;
		P2A = i;
		P3A = i;
		P4A = i;
		P5A = i;
		P6A = i;
		
		#15;
		
		end
		
		#100;
		
		E4A = 1'b0;
		E5A = 1'b1; // E5 spare
		
		for (i = 0; i<1024; i = i +1) begin
	
		P0A = i; //all the potentiometer user inputs - testing only selected changes
		P1A = i;
		P2A = i;
		P3A = i;
		P4A = i;
		P5A = i;
		P6A = i;
		
		#15;
		
		end
		
		#100;
		
		E5A = 1'b0;
		E6A = 1'b1; // E6 - spare II
		
		for (i = 0; i<1024; i = i +1) begin
	
		P0A = i; //all the potentiometer user inputs - testing only selected changes
		P1A = i;
		P2A = i;
		P3A = i;
		P4A = i;
		P5A = i;
		P6A = i;
		
		#15;
		
		end
		
		#100;
		
		E6A = 1'b0;
		E7A = 1'b1; // power - to test
		
		for (i = 0; i<1024; i = i +1) begin
	
		P7A = i; //testing volume
		
		#15;
		
		end 
		RESET = 1'b1;
	   RESET_N = 1'b0; //negative reset
		
		#30;
		
		RESET = 1'b0;
	   RESET_N = 1'b1; //negative reset
		
		#3000;
		
		
		
		for (i = 0; i<1024; i = i +1) begin
	
		P0A = i; //all the potentiometer user inputs - testing only selected changes
		P1A = i;
		P2A = i;
		P3A = i;
		P4A = i;
		P5A = i;
		P6A = i;
		
		#15;
		
		end
		
		
	$stop;
		
end 

endmodule
