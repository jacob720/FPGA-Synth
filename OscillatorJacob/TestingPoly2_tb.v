`timescale 1 ns/100 ps


module TestingPoly2_tb;

	reg clk;
	reg slow_clk;
	reg reset;
	reg [1:0] ctrl;
	
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
	wire [15:0] wave16;
	wire [19:0] mixed_signal;
	
	TestingPoly2 dut(
		clk,
		slow_clk,
		reset,
		ctrl,
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
		wave16,
		mixed_signal
	);
	
	integer i;
	
	initial begin
		
		ctrl = 2;
		clk = 0;
		slow_clk = 0;
		reset = 0;
		#10;
		clk = 1;
		reset = 1;
		#10;
		reset = 0;
		clk = 0;
		
		for (i = 0; i < 1000000000; i = i + 1) begin
			#10;
			clk = ~clk;
			if (i % 1000000 == 0) begin
				slow_clk = ~slow_clk;
			end
		end
		
		$stop;
		
	end
	
endmodule
		
		
		