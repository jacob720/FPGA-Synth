`timescale 1 ns/100 ps

module Chords_tb;

	reg slow_clk;
	reg reset;
	reg [1:0] ctrl;
 
	wire [6:0] note1;
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
	wire [6:0] note16;
	
	Chords dut(
		slow_clk,
		reset,
		ctrl,
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
		note15,
		note16
	);
	
	integer i;
	
	initial begin
	
		slow_clk = 0;
		reset = 0;
		#10;
		reset = 1;
		#10;
		reset = 0;
		#10
	
		for (i = 0; i < 128; i = i + 1) begin
		
			slow_clk = ~slow_clk;
			#10;
			
		end
	
		$stop;

	end
	
endmodule
	