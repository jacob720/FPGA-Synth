/* ThirtyTwoBitFullAdder.v

By: Jacob Williamson

Module Description:
A thirty-two bit full adder module

Inputs:
a [31:0] - The first number to be added
b [31:0] - The second number to be added
c_in - Carry in

Outputs:
sum [31:0] - The sum of the two numbers being added
c_out - Carry out

*/

module ThirtyTwoBitFullAdder(

	input [31:0] a,
	input [31:0] b,
	input c_in,
	output [31:0] sum,
	output c_out
	
);
	
	wire [2:0] w1;
	
	EightBitFullAdder adder1(
		a[7:0],
		b[7:0],
		c_in,
		sum[7:0],
		w1[0]
	);
	
	EightBitFullAdder adder2(
		a[15:8],
		b[15:8],
		w1[0],
		sum[15:8],
		w1[1]
	);
	
	EightBitFullAdder adder3(
		a[23:16],
		b[23:16],
		w1[1],
		sum[23:16],
		w1[2]
	);
	
	EightBitFullAdder adder4(
		a[31:24],
		b[31:24],
		w1[2],
		sum[31:24],
		c_out
	);
	
	
		

endmodule
