/* SixteenBitFullAdder.v

By: Jacob Williamson

Module Description:
A seventeen bit full adder module

Inputs:
a [15:0] - the first number to be added
b [15:0] - the second number to be added
c_in - carry in

Outputs:
sum [15:0] - the sum of the two numbers being added
c_out - carry out

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
