/* SeventeenBitFullAdder.v

By: Jacob Williamson

Module Description:
A seventeen bit full adder module

Inputs:
a [16:0] - the first number to be added
b [16:0] - the second number to be added
c_in - carry in

Outputs:
sum [16:0] - the sum of the two numbers being added
c_out - carry out

*/

module SeventeenBitFullAdder(

	input [16:0] a,
	input [16:0] b,
	input c_in,
	output [16:0] sum,
	output c_out
	
);

	wire w1;

	SixteenBitFullAdder adder1(
		a[15:0],
		b[15:0],
		c_in,
		sum[15:0],
		w1
	);
	
	OneBitFullAdder adder2(
		a[16],
		b[16],
		w1,
		sum[16],
		c_out
	);
	
endmodule
