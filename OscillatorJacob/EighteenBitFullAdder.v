/* EighteenBitFullAdder.v

By: Jacob Williamson

Module Description:
An eighteen bit full adder module

Inputs:
a [17:0] - the first number to be added
b [17:0] - the second number to be added
c_in - carry in

Outputs:
sum [17:0] - the sum of the two numbers being added
c_out - carry out

*/

module EighteenBitFullAdder(

	input [17:0] a,
	input [17:0] b,
	input c_in,
	output [17:0] sum,
	output c_out
	
);

	wire w1;

	SeventeenBitFullAdder adder1(
		a[16:0],
		b[16:0],
		c_in,
		sum[16:0],
		w1
	);
	
	OneBitFullAdder adder2(
		a[17],
		b[17],
		w1,
		sum[17],
		c_out
	);
	
endmodule
