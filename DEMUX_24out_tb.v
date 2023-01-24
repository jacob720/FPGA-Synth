`timescale 1 ns / 100 ps

module DEMUX_24out_tb;
	reg clk;
	reg [7:0]in;
	reg [4:0]sel;
	wire [7:0]out0;
	wire [7:0]out1;
	wire [7:0]out2;
	wire [7:0]out3;
	wire [7:0]out4;
	wire [7:0]out5;
	wire [7:0]out6;
	wire [7:0]out7;
	wire [7:0]out8;
	wire [7:0]out9;
	wire [7:0]out10;
	wire [7:0]out11;
	wire [7:0]out12;
	wire [7:0]out13;
	wire [7:0]out14;
	wire [7:0]out15;
	wire [7:0]out16;
	wire [7:0]out17;
	wire [7:0]out18;
	wire [7:0]out19;
	wire [7:0]out20;
	wire [7:0]out21;
	wire [7:0]out22;
	wire [7:0]out23;
	
	DEMUX_24out dut(
	 clk,
	 in,
	 sel,
	 out0,
	 out1,
	 out2,
	 out3,
	 out4,
	 out5,
	 out6,
	 out7,
	 out8,
	 out9,
	 out10,
	 out11,
	 out12,
	 out13,
	 out14,
	 out15,
	 out16,
	 out17,
	 out18,
	 out19,
	 out20,
	 out21,
	 out22,
	 out23
	);
	
	integer i;
	integer j;
	always begin
		
		#1;
		clk <= ~clk;
		
	end
	initial begin
	clk = 1;
		for(i=0;i<24;i=i+1) begin
			sel=i;
			for(j=0;j<4;j=j+1) begin
				in=$random()%255;
				#5;
			end
		end
		$stop;
	
	end
	
endmodule