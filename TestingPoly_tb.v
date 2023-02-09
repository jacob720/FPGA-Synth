`timescale 1 ns/100 ps


module TestingPoly_tb;

	reg clk;
	reg reset;
	reg [1:0] ctrl;
	reg [6:0] note1;
	reg [6:0] note2;
	reg [6:0] note3;
	reg [6:0] note4;
	wire [15:0] wave1;
	wire [15:0] wave2;
	wire [15:0] wave3;
	wire [15:0] wave4;
	
	TestingPoly dut(
		clk,
		reset,
		ctrl,
		note1,
		note2,
		note3,
		note4,
		wave1,
		wave2,
		wave3,
		wave4
	);
	
	integer i;
	
	initial begin
		
		ctrl = 2;
		clk = 0;
		note1 = 22;
		note2 = 34;
		note3 = 48;
		note4 = 56;
		reset = 0;
		#10;
		clk = 1;
		reset = 1;
		#10;
		reset = 0;
		clk = 0;
	
		for (i = 0; i < 5000000; i = i + 1) begin
			#10;
			clk = ~clk;
			i = i + 1;
		end
	
	$stop;
	
	end
	
endmodule
		
		
		