`timescale 1 ns / 100 ps

module Decay_tb;
	reg clk;
	reg clk_d;
	reg [19:0]in;
	reg [4:0]decay_amount;
	reg start;
	wire [19:0] out;
	wire [4:0] shift_amount;
	wire start_sustain;

	
	Decay dut(
	clk,
	clk_d,
	in,
	decay_amount,
	start,
	out,
	shift_amount,
	start_sustain
);
	integer d;
	integer i;
	integer j;
	
	always begin
		clk = ~clk;
		#2;
	end
	
	always begin
		clk_d = ~clk_d;
		#d;
	end
	
	always begin
		in = ~in;
		#5;
	end
	
	
	initial begin
		clk=1'b1;
		clk_d = 1'b1;
		start=1'b0;
		d = $urandom()%32;
		//in= $urandom()%256;
		in=20'b11111111111111111111;
		#10;
		start=1'b1;
		//in= $urandom()%256;
		#10;
		start =1'b0;
		for(j=0; j<20; j=j+1) begin
				decay_amount = j;
				start = 1'b1;
				#10;
				start = 1'b0;
			for(i=0; i<40; i=i+1) begin
				//in= $urandom()%256;
				#100;
			end
		end
	
	$stop;
	end


endmodule