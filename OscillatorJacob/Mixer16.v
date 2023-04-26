/* Mixer16.v

By: Jacob Williamson

Module Description:
A module to mix 16 16-bit signals together.

Inputs:
clk - clock.
signal1 [15:0]
signal2 [15:0]
signal3 [15:0]
signal4 [15:0]
signal5 [15:0]
signal6 [15:0]
signal7 [15:0]
signal8 [15:0]
signal9 [15:0]
signal10 [15:0]
signal11 [15:0]
signal12 [15:0]
signal13 [15:0]
signal14 [15:0]
signal15 [15:0]
signal16 [15:0]


Outputs:
mixed [19:0] - the mixed signal.

*/

module Mixer16(
	input clk,
	input [15:0] signal1,
	input [15:0] signal2,
	input [15:0] signal3,
	input [15:0] signal4,
	input [15:0] signal5,
	input [15:0] signal6,
	input [15:0] signal7,
	input [15:0] signal8,
	input [15:0] signal9,
	input [15:0] signal10,
	input [15:0] signal11,
	input [15:0] signal12,
	input [15:0] signal13,
	input [15:0] signal14,
	input [15:0] signal15,
	input [15:0] signal16,
	output reg [19:0] mixed_signal
);
	
	wire [16:0] w1;
	wire [16:0] w2;
	wire [16:0] w3;
	wire [16:0] w4;
	wire [16:0] w5;
	wire [16:0] w6;
	wire [16:0] w7;
	wire [16:0] w8;
	
	wire [17:0] w9;
	wire [17:0] w10;
	wire [17:0] w11;
	wire [17:0] w12;

	wire [18:0] w13;
	wire [18:0] w14;
	
	wire [19:0] w15;
	
	SixteenBitFullAdder sixteen1(
		signal1,
		signal2,
		1'b0,
		w1[15:0],
		w1[16]
	);
	
	SixteenBitFullAdder sixteen2(
		signal3,
		signal4,
		1'b0,
		w2[15:0],
		w2[16]
	);
	
	SixteenBitFullAdder sixteen3(
		signal5,
		signal6,
		1'b0,
		w3[15:0],
		w3[16]
	);
	
	SixteenBitFullAdder sixteen4(
		signal7,
		signal8,
		1'b0,
		w4[15:0],
		w4[16]
	);
	
	SixteenBitFullAdder sixteen5(
		signal9,
		signal10,
		1'b0,
		w5[15:0],
		w5[16]
	);
	
	SixteenBitFullAdder sixteen6(
		signal11,
		signal12,
		1'b0,
		w6[15:0],
		w6[16]
	);
	
	SixteenBitFullAdder sixteen7(
		signal13,
		signal14,
		1'b0,
		w7[15:0],
		w7[16]
	);
	
	SixteenBitFullAdder sixteen8(
		signal15,
		signal16,
		1'b0,
		w8[15:0],
		w8[16]
	);
	
	SeventeenBitFullAdder seventeen1(
		w1,
		w2,
		1'b0,
		w9[16:0],
		w9[17]
	);
	
	SeventeenBitFullAdder seventeen2(
		w3,
		w4,
		1'b0,
		w10[16:0],
		w10[17]
	);
	
	SeventeenBitFullAdder seventeen3(
		w5,
		w6,
		1'b0,
		w11[16:0],
		w11[17]
	);
	
	SeventeenBitFullAdder seventeen4(
		w7,
		w8,
		1'b0,
		w12[16:0],
		w12[17]
	);
		
	EighteenBitFullAdder eighteen1(
		w9,
		w10,
		1'b0,
		w13[17:0],
		w13[18]
	);
	
	EighteenBitFullAdder eighteen2(
		w11,
		w12,
		1'b0,
		w14[17:0],
		w14[18]
	);
	
	NineteenBitFullAdder nineteen1(
		w13,
		w14,
		1'b0,
		w15[18:0],
		w15[19]
	);
	
	always @ (posedge clk) begin
		
		mixed_signal <= w15;
		
	end
	
endmodule
