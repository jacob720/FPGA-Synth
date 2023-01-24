/* OneBitFullAdder.v

By: Jacob Williamson

Module Description:
A single bit full adder module

Inputs:
a - The first number to be added
b - The second number to be added
c_in - Carry in

Outputs:
sum - The sum of the two numbers being added
c_out - Carry out

*/

module OneBitFullAdder(
	input a,
	input b,
	input c_in,
	output sum,
	output c_out
);

	wire w1;
	wire w2;
	wire w3;
	
	xor(w1, a, b);
	xor(sum, w1, c_in);
	
	and(w2, w1, c_in);
	and(w3, a, b);
	or(c_out, w2, w3);
	
endmodule

	