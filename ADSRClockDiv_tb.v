//ADSR test bench
//Sophie Watson
//16/2/23
//4 user inputs, 4 variable outputs - should only update if the enable pin is 1

`timescale 1 ms/100 ns

module ADSRClockDiv_tb;

	reg [9:0] POT0; //A
	reg [9:0] POT1; //D
	reg [9:0] POT2; //S
	reg [9:0] POT3; //R
	reg ENABLE; //user switch - load to DFF
	reg Reset; //for 50-100hz clk currently is active low and this needs to change, so maybe stick a not gate on it
	//input clk100hz,
	reg clk50Mhz;
	wire OUT_A; //0 or 1
	wire OUT_D; //0 or 1
	wire [3:0] OUT_S; // between 2-12
	wire OUT_R; //0 or 1 
	
	ADSRClockDiv dut(

	POT0,
	POT1,
	POT2,
	POT3,
	ENABLE, //user switch - load to DFF
	Reset, //for 50-100hz clk currently
	//input clk100hz,
	clk50Mhz,
	OUT_A, //0 or 1
	OUT_D, //0 or 1
	OUT_S, // between 2-12
	OUT_R //0 or 1
);


integer i;


	always begin
	
	#10;
	clk50Mhz <= ~ clk50Mhz;
	
	end
	




initial begin

			Reset = 1'b1; //everything into a known state
			#3
			Reset = 1'b0;
			#3
			Reset= 1'b1;
			#3
			clk50Mhz = 1'b1;
			
			#14
			
			ENABLE = 1;
		
			POT2 = 400; //sustain level
			POT0 = 25; //A
			POT1 = 25; //D
			POT3 = 25; //R
	
			#143435666	//random not integer so that the reset does trigger the clock
			
			ENABLE = 0; 
		
			POT2 = 20; //sustain level
			POT0 = 20; //A
			POT1 = 20; //D
			POT3 = 20; //R
		
			
			#143435666
			
			
			Reset = 1'b1; //everything into a known state
			#3
			Reset = 1'b0;
			#3
			Reset = 1'b1;
			#14343566
		
		$stop;
	end



endmodule
