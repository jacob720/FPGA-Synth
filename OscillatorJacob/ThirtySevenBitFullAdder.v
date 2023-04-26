/* ThirtySevenBitFullAdder.v

By: Jacob Williamson

Module Description:
A thirty-seven bit full adder module

Inputs:
a [36:0] - The first number to be added
b [36:0] - The second number to be added
c_in - Carry in

Outputs:
sum [36:0] - The sum of the two numbers being added
c_out - Carry out

*/

module ThirtySevenBitFullAdder(
	input [36:0] a,
	input [36:0] b,
	input c_in,
	output [36:0] sum,
	output c_out
);

	wire [4:0] carry;

	ThirtyTwoBitFullAdder adder1(
		a[31:0],
		b[31:0],
		c_in,
		sum[31:0],
		carry[0]
	);
	
	OneBitFullAdder adder2(
		a[32],
		b[32],
		carry[0],
		sum[32],
		carry[1]
	);
	
	OneBitFullAdder adder3(
		a[33],
		b[33],
		carry[1],
		sum[33],
		carry[2]
	);
	
	OneBitFullAdder adder4(
		a[34],
		b[34],
		carry[2],
		sum[34],
		carry[3]
	);
	
	OneBitFullAdder adder5(
		a[35],
		b[35],
		carry[3],
		sum[35],
		carry[4]
	);
	
	OneBitFullAdder adder6(
		a[36],
		b[36],
		carry[4],
		sum[36],
		c_out
	);
	
endmodule 
