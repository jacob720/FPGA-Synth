//WONT WORK AS OUT INS CHANGED

`timescale 1 ns / 100 ps

module SequencerII_tb; //to test the overal sequencer architecture

	reg clk100hz; 
	reg reset;
	reg [1:0] ctrl; //for user to change chord, not yet in use
	reg [9:0] userInput; //from arduino, for the variable clock length
	//reg [3:0] count_in; //to test trigger

	wire [19:0] frequency0; //output from LUT (to go to memory)
	wire [19:0] frequency1;
	wire [19:0] frequency2;
	wire [19:0] frequency3;
	wire [19:0] frequency4;
	wire [19:0] frequency5;
	wire [19:0] frequency6;
	wire [19:0] frequency7;
	wire [19:0] frequency8;
	wire [19:0] frequency9;
	wire [19:0] frequency10;
	wire [19:0] frequency11;
	wire [19:0] frequency12;
	wire [19:0] frequency13;
	wire [19:0] frequency14;
	wire [19:0] frequency15;
	
	wire [15:0] Trigger; //output to memory and adsr, note on/off
	
	
	wire end_count;
	wire variableClk; //to monitor
	//wire [3:0] count_out; //to monitor
	
SequencerII dut(


	clk100hz, 
	reset,
	ctrl, //for user to change chord, not yet in use
	userInput, //from arduino, for the variable clock length
	
	//count_in, //to test trigger

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
	
	Trigger, //output to memory and adsr, note on/off
	
	
	end_count,
	variableClk	//to monitor
	//count_out //to monitor

);


integer i;


initial begin

		clk100hz = 1'b0; #5; clk100hz = 1'b1; #5;
		
		reset = 0;
		clk100hz = 1'b0; #5; clk100hz = 1'b1; #5;
		reset = 1;
		clk100hz = 1'b0; #5; clk100hz = 1'b1; #5;
		reset = 0;
		clk100hz = 1'b0; #5; clk100hz = 1'b1; #5;

		ctrl = 0;
	
		clk100hz = 1'b0; #5; clk100hz = 1'b1; #5;
		
		reset = 0;
		clk100hz = 1'b0; #5; clk100hz = 1'b1; #5;
		reset = 1;
		clk100hz = 1'b0; #5; clk100hz = 1'b1; #5;
		reset = 0;
		clk100hz = 1'b0; #5; clk100hz = 1'b1; #5;
		
		
		//count_in = 1'b0;
		
		clk100hz = 1'b0; #5; clk100hz = 1'b1; #5;
	
		for (i = 0; i<2000; i = i +1) begin 
		
		userInput = 200;
		//count_in = 1'b1;
		
		
		clk100hz = 1'b0; #5; clk100hz = 1'b1; #5;
		
		end
		
		
		for (i = 0; i<2000; i = i +1) begin 
		
		userInput = 700;
		
		//count_in = 2'b10;
		
		clk100hz = 1'b0; #5; clk100hz = 1'b1; #5;
		
		
		end
		
		for (i = 0; i<200; i = i +1) begin 
		
		userInput = 0;
		
		//count_in = 2'b10;
		
		clk100hz = 1'b0; #5; clk100hz = 1'b1; #5;
		
		
		end
		
		for (i = 0; i<4000; i = i +1) begin 
		
		userInput = 800;
		
		//count_in = 2'b10;
		
		clk100hz = 1'b0; #5; clk100hz = 1'b1; #5;
		
		
		end
		
		$stop;
	end



endmodule