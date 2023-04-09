`timescale 1 ns / 100 ps

module Reduced17Tap_FIR_tb;
	reg clk;
	reg [19:0] in;
	reg [15:0] h0;
	reg [15:0] h1;
	reg [15:0] h2;
	reg [15:0] h3;
	reg [15:0] h4;
	reg [15:0] h5;
	reg [15:0] h6;
	reg [15:0] h7;
	reg [15:0] h8;
	wire [19:0] out;
	
	Reduced17Tap_FIR dut(
		clk,
		in,
		h0,
		h1,
		h2,
		h3,
		h4,
		h5,
		h6,
		h7,
		h8,
		out
	);
	
	always begin
		clk = ~clk;
		#5;
	end
	
	always begin
		in = ~in;
		#1000;
	end
	
	initial begin
		clk = 1'b1;
		in = 20'b0;
		h0 = 16'b1111110110110101;
		h1 = 16'b1111110110001011;
		h2 = 16'b1111111001011001;
		h3 = 16'b0000000110101011;
		h4 = 16'b0000011111001111;
		h5 = 16'b0000111111111100;
		h6 = 16'b0001100001100000;
		h7 = 16'b0001111010110010;
		h8 = 16'b0010000100001100;
		#500000;
		$stop;
	end
	
endmodule