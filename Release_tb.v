`timescale 1 ns / 100 ps

module Release_tb;
	reg clk;
	reg clk_r;
	reg start;
	reg [4:0] sustain_level;
	reg [19:0] in;
	wire [19:0] out;
	wire end_release;
	
	Release dut(
		clk,
		clk_r,
		start,
		sustain_level,
		in,
		out,
		end_release
	);
	
	integer i;
	integer r;
	
	always begin
		clk = ~clk;
		#2;
	end
	
	always begin
		clk_r = ~clk_r;
		#r;
	end
	
	always begin
		in = ~in;
		#5;
	end
	
	initial begin
		clk = 1'b1;
		clk_r = 1'b1;
		r = $urandom()%32;
		start = 1'b0;
		sustain_level = 4'b0000;
		in = 20'b11111111111111111111;
		#20;
		for (i = 0; i < 16; i = i+1) begin
		start = 1'b1;
		sustain_level = i;
		#1000;
		start = 1'b0;
		
		#1000;
		
		end
	$stop;
	end

endmodule