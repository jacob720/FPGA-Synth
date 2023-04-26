//testbench for the volume dac control module


`timescale 1 ns/100 ps
	
	module variableInputRegisters_tb;

	reg clk; //50mhz clk
	reg [9:0] P0; //all the potentiometer user inputs
	reg [9:0] P1;
	reg [9:0] P2;
	reg [9:0] P3;
	reg [9:0] P4;
	reg [9:0] P5;
	reg [9:0] P6;
	
	//input E0, //seq
	reg E1; //osc
	//input E2, //adsr
	reg E3; //filter
	reg E4; //effects
	reg E5; //spare
	reg E6; //spare
	
	//seq00 - in module 
	wire [9:0] Osc01; //numbers correlate to reg number, bank number - preassigned have code
	wire [9:0] Osc11;
	wire [9:0] Osc21;
	wire [9:0] Osc31;
	wire [9:0] Osc41;
	wire [9:0] Osc51;
	wire [9:0] Osc61;
	//adsr02 - in module
	wire [9:0] Fltr03;
	wire [9:0] Fltr13;
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
	
	
	variableInputRegisters dut(

	 clk, //50mhz clk
	 P0, //all the potentiometer user inputs
	 P1,
	 P2,
	 P3,
	 P4,
	 P5,
	 P6,
	
	//input E0, //seq
	 E1, //osc
	//input E2, //adsr
	 E3, //filter
	 E4, //effects
	 E5, //spare
	 E6, //spare
	
	//seq00 - in module 
	 Osc01, //numbers correlate to reg number, bank number - preassigned have code
	 Osc11,
	 Osc21,
	 Osc31,
	 Osc41,
	 Osc51,
	 Osc61,
	//adsr02 - in module
    Fltr03,
	 Fltr13,
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
	 E66

);

always begin

		#5;
		clk = ~clk;
		
		
end 

integer i = 0;

initial begin 

		clk = 1'b0;
		
		P0 = 9'b00000000; //all the potentiometer user inputs
		P1 = 9'b00000000;
		P2 = 9'b00000000;
		P3 = 9'b00000000;
		P4 = 9'b00000000;
		P5 = 9'b00000000;
		P6 = 9'b00000000;
	//input E0, //seq
		E1 = 1'b0; //osc
	//input E2, //adsr
		E3 = 1'b0; //filter
		E4 = 1'b0; //effects
		E5 = 1'b0; //spare
		E6 = 1'b0;
		
		#100
		
		E1 = 1'b1; // osc
		
		for (i = 0; i<1024; i = i +1) begin
	
		P0 = i; //all the potentiometer user inputs - testing only selected changes
		P1 = i;
		P2 = i;
		P3 = i;
		P4 = i;
		P5 = i;
		P6 = i;
		
		#15;
		
		end
		
		#100;
		
		E1 = 1'b0;
		E3 = 1'b1; // osc
		
		for (i = 0; i<1024; i = i +1) begin
	
		P0 = i; //all the potentiometer user inputs - testing only selected changes
		P1 = i;
		P2 = i;
		P3 = i;
		P4 = i;
		P5 = i;
		P6 = i;
		
		#15;
		
		end
		
		#100;
		
		E3 = 1'b0;
		E4 = 1'b1; // osc
		
		for (i = 0; i<1024; i = i +1) begin
	
		P0 = i; //all the potentiometer user inputs - testing only selected changes
		P1 = i;
		P2 = i;
		P3 = i;
		P4 = i;
		P5 = i;
		P6 = i;
		
		#15;
		
		end
		#100;
		
		E4 = 1'b0;
		E5 = 1'b1; // osc
		
		for (i = 0; i<1024; i = i +1) begin
	
		P0 = i; //all the potentiometer user inputs - testing only selected changes
		P1 = i;
		P2 = i;
		P3 = i;
		P4 = i;
		P5 = i;
		P6 = i;
		
		#15;
		
		end
		
		#100;
		
		E5 = 1'b0;
		E6 = 1'b1; // osc
		
		for (i = 0; i<1024; i = i +1) begin
	
		P0 = i; //all the potentiometer user inputs - testing only selected changes
		P1 = i;
		P2 = i;
		P3 = i;
		P4 = i;
		P5 = i;
		P6 = i;
		
		#15;
		
		end
		
	$stop;
		
end 

endmodule
		
		
		
