/* ThirtyTwoBitMultiplier.v

By: Jacob Williamson

Module Description:
A module produce to multiply two 16 bit numbers, getting a 32 bit result.

Inputs:
a [19:0] - First number being multiplied.
b [7:0] - Second number being multiplied. 

Outputs:
product [27:0] - Product of the multipication.

*/

module TwentyBitMultiplier(
	input [19:0] a,
	input [7:0] b,
	output [27:0] product
);

	wire [7:0] carry_w;
	wire [18:0] sum_w1;
	wire [19:0] sum_w2;
	wire [19:0] sum_w3;
	wire [19:0] sum_w4;
	wire [19:0] sum_w5;
	wire [19:0] sum_w6;
	wire [19:0] sum_w7;
	
	and(product[0], a[0], b[0]);
	and(sum_w1[0], a[1], b[0]);
	and(sum_w1[1], a[2], b[0]);
	and(sum_w1[2], a[3], b[0]);
	and(sum_w1[3], a[4], b[0]);
	and(sum_w1[4], a[5], b[0]);
	and(sum_w1[5], a[6], b[0]);
	and(sum_w1[6], a[7], b[0]);
	and(sum_w1[7], a[8], b[0]);
	and(sum_w1[8], a[9], b[0]);
	and(sum_w1[9], a[10], b[0]);
	and(sum_w1[10], a[11], b[0]);
	and(sum_w1[11], a[12], b[0]);
	and(sum_w1[12], a[13], b[0]);
	and(sum_w1[13], a[14], b[0]);
	and(sum_w1[14], a[15], b[0]);
	and(sum_w1[15], a[16], b[0]);
	and(sum_w1[16], a[17], b[0]);
	and(sum_w1[17], a[18], b[0]);
	and(sum_w1[18], a[19], b[0]);
	
	TwentyCellArrayRow row1(
		a, 
		{20{b[1]}}, 
		{1'b0, sum_w1},
		{sum_w2[18:0], product[1]},
		sum_w2[19]
	);
	
	TwentyCellArrayRow row2(
		a, 
		{20{b[2]}}, 
		sum_w2,
		{sum_w3[18:0], product[2]},
		sum_w3[19]
	);
	
	TwentyCellArrayRow row3(
		a, 
		{20{b[3]}}, 
		sum_w3,
		{sum_w4[18:0], product[3]},
		sum_w4[19]
	);
	
	TwentyCellArrayRow row4(
		a, 
		{20{b[4]}}, 
		sum_w4,
		{sum_w5[18:0], product[4]},
		sum_w5[19]
	);
	
	TwentyCellArrayRow row5(
		a, 
		{20{b[5]}}, 
		sum_w5,
		{sum_w6[18:0], product[5]},
		sum_w6[19]
	);
	
	TwentyCellArrayRow row6(
		a, 
		{20{b[6]}}, 
		sum_w6,
		{sum_w7[18:0], product[6]},
		sum_w7[19]
	);
	
	TwentyCellArrayRow row7(
		a, 
		{20{b[7]}}, 
		sum_w7,
		product[26:7],
		product[27]
	);
	
endmodule
		
	