`timescale 1 ns / 100 ps

module ADSR_tb;
	reg clk;
	reg clk_attack;
	reg clk_decay;
	reg clk_release;
	reg note_on;
	reg reset;
	reg [15:0] in;
	reg [4:0] sustain_level;
	wire [19:0] signal_out;
	wire [3:0] count_out;
	
	ADSR dut(
		clk,
		clk_attack,
		clk_decay,
		clk_release,
		note_on,
		reset,
		in,
		sustain_level,
		signal_out,
		count_out
	);
	
	integer a;
	integer d;
	integer r;
	
	always begin
		clk = ~clk;
		#2;
	end
	
	always begin
		clk_attack = ~clk_attack;
		#a;
	end
	
	always begin 
		clk_decay = ~clk_decay;
		#d;
	end
	
	always begin 
		clk_release = ~clk_release;
		#r;
	end
	
	always begin
		in = ~in;
		#4;
	end
	
	initial begin
		clk = 1'b1;
		clk_attack = 1'b1;
		clk_release = 1'b1;
		clk_decay = 1'b1;
		a = $urandom()%32;
		d = $urandom()%32;
		r = $urandom()%32;
		note_on = 1'b0;
		reset = 1'b0;
		in = 16'b1111111111111111;
		sustain_level = 5'b00011;
		#10;
		reset = 1'b1;
		#10;
		reset = 1'b0;
		#30;
		note_on = 1'b1;
		#3000;
		note_on = 1'b0;
		#1200;
		note_on = 1'b1;
		sustain_level = 5'b00110;
		#3000;
		note_on = 1'b0;
		#1000;
	$stop;
	end
	
	
	
endmodule