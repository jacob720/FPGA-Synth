`timescale 1ns/100ps

module Sophie2Osc_tb;

	reg clk; //system 50mhz clk
	
	reg reset;
	reg [1:0] ctrl; //for user to change chord, not yet in use
	reg [9:0] userInput; //from arduino, for the variable clock length
	reg enable; //for the mem reg containing user input, stops user from chagning all parameters

	//input [3:0] count_in, //to test

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
	
	wire [15:0] Triggeradsr; //output to adsr, note on/off
	
	
	wire end_count; //end of osc run (16)
	wire clk100hzout2;
	
	
	//output wire [3:0] count_out //to monitor
	

	
Sophie2Osc dut (


	clk, //system 50mhz clk
	
	reset,
	ctrl, //for user to change chord, not yet in use
	userInput, //from arduino, for the variable clock length
	enable, //for the mem reg containing user input, stops user from chagning all parameters

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
	
	clk100hzout2
	//clk100hzout

);


integer i;


always begin
	
	#10
	
	clk <= ~clk;
	
end


initial begin
		userInput = 100;
		enable = 1;
		ctrl = 0;
		clk = 1;
		#400
		reset = 0;
		#400
		reset = 1;
		#400
		reset = 0;	
		
		#199934356
	
		
		$stop;
	end



endmodule
	