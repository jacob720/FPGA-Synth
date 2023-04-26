/* NineteenBitFullAdder.v

By: Jacob Williamson

Module Description:
A nineteen bit full adder module

Inputs:
a [18:0] - the first number to be added
b [18:0] - the second number to be added
c_in - carry in

Outputs:
sum [18:0] - the sum of the two numbers being added
c_out - carry out

*/

module NineteenBitFullAdder(

	input [18:0] a,
	input [18:0] b,
	input c_in,
	output [18:0] sum,
	output c_out
	
);

	wire w1;

	EighteenBitFullAdder adder1(
		a[17:0],
		b[17:0],
		c_in,
		sum[17:0],
		w1
	);
	
	OneBitFullAdder adder2(
		a[18],
		b[18],
		w1,
		sum[18],
		c_out
	);
	
endmodule
