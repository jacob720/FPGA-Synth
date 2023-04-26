`timescale 1 ns/100 ps

module Mixer16_tb;

	reg clk;
	reg [15:0] signal1;
	reg [15:0] signal2;
	reg [15:0] signal3;
	reg [15:0] signal4;
	reg [15:0] signal5;
	reg [15:0] signal6;
	reg [15:0] signal7;
	reg [15:0] signal8;
	reg [15:0] signal9;
	reg [15:0] signal10;
	reg [15:0] signal11;
	reg [15:0] signal12;
	reg [15:0] signal13;
	reg [15:0] signal14;
	reg [15:0] signal15;
	reg [15:0] signal16;
	wire [19:0] mixed_signal;
	
	Mixer16 dut(
		clk,
		signal1,
		signal2,
		signal3,
		signal4,
		signal5,
		signal6,
		signal7,
		signal8,
		signal9,
		signal10,
		signal11,
		signal12,
		signal13,
		signal14,
		signal15,
		signal16,
		mixed_signal
	);
	
	integer i;
	integer expected_result;
	integer actual_result;
	integer incorrect;
	
	initial begin
	
		clk = 0;
		incorrect = 0;
		
		for (i = 0; i < 100000; i = i + 1) begin
		
			clk = ~clk;
			
			if(clk) begin 
				signal1 = $urandom % 65536;
				signal2 = $urandom % 65536;
				signal3 = $urandom % 65536;
				signal4 = $urandom % 65536;
				signal5 = $urandom % 65536;
				signal6 = $urandom % 65536;
				signal7 = $urandom % 65536;
				signal8 = $urandom % 65536;
				signal9 = $urandom % 65536;
				signal10 = $urandom % 65536;
				signal11 = $urandom % 65536;
				signal12 = $urandom % 65536;
				signal13 = $urandom % 65536;
				signal14 = $urandom % 65536;
				signal15 = $urandom % 65536;
				signal16 = $urandom % 65536;
			end
			
			#1;
			
			actual_result = mixed_signal;
			expected_result = signal1 + signal2 + signal3 + signal4 + signal5 + signal6 + signal7 + signal8 + signal9 + signal10 + signal11 + signal12 + signal13 + signal14 + signal15 + signal16;
			
			if (!(actual_result == expected_result)) begin
				$display("Incorrect result at i = %d", i);
				incorrect = incorrect + 1;
			end
			
		end
		
		if (!incorrect) begin
			$display("All results correct!");
		end
		
		$stop;
	
	end
	
endmodule 
		