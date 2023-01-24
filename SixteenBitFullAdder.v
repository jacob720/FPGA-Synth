/* SIxteenBitFullAdder.v

By: Jacob Williamson

Module Description:
A thirty-two bit full adder module

Inputs:
a [15:0] - The first number to be added
b [15:0] - The second number to be added
c_in - Carry in

Outputs:
sum [15:0] - The sum of the two numbers being added
c_out - Carry out

*/

module SixteenBitFullAdder(

	input [15:0] a,
	input [15:0] b,
	input c_in,
	output [15:0] sum,
	output c_out
	
);
	
	wire w1;
	
	EightBitFullAdder adder1(
		a[7:0],
		b[7:0],
		c_in,
		sum[7:0],
		w1
	);
	
	EightBitFullAdder adder2(
		a[15:8],
		b[15:8],
		w1,
		sum[15:8],
		c_out
	);
		

endmodule
