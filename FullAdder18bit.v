

/* FullAdder18bit.v

based on OneBitFullAdder.v by Jacob Williamson

Module Description:
An eight bit full adder module
Inputs:
a [17:0] - The first number to be added
b [17:0] - The second number to be added
c_in - Carry in
Outputs:
sum [17:0] - The sum of the two numbers being added
c_out - Carry out
*/

module FullAdder18bit(

	input [17:0] a,
	input [17:0] b,
	input c_in,
	output [17:0] sum,
	output c_out
);
	
	wire [16:0] w1;
	
	OneBitFullAdder adder1(
		a[0],
		b[0],
		c_in,
		sum[0],
		w1[0]
	);
	
	OneBitFullAdder adder2(
		a[1],
		b[1],
		w1[0],
		sum[1],
		w1[1]
	);
	
	OneBitFullAdder adder3(
		a[2],
		b[2],
		w1[1],
		sum[2],
		w1[2]
	);
	
	OneBitFullAdder adder4(
		a[3],
		b[3],
		w1[2],
		sum[3],
		w1[3]
	);
	
	OneBitFullAdder adder5(
		a[4],
		b[4],
		w1[3],
		sum[4],
		w1[4]
	);
	
	OneBitFullAdder adder6(
		a[5],
		b[5],
		w1[4],
		sum[5],
		w1[5]
	);
	
	OneBitFullAdder adder7(
		a[6],
		b[6],
		w1[5],
		sum[6],
		w1[6]
	);
	
	OneBitFullAdder adder8(
		a[7],
		b[7],
		w1[6],
		sum[7],
		w1[7]
	);
	
	OneBitFullAdder adder9(
		a[8],
		b[8],
		w1[7],
		sum[8],
		w1[8]
	);
	
	OneBitFullAdder adder10(
		a[9],
		b[9],
		w1[8],
		sum[9],
		w1[9]
	);
	
	OneBitFullAdder adder11(
		a[10],
		b[10],
		w1[9],
		sum[10],
		w1[10]
	);
	
	OneBitFullAdder adder12(
		a[11],
		b[11],
		w1[10],
		sum[11],
		w1[11]
	);
	
	OneBitFullAdder adder13(
		a[12],
		b[12],
		w1[11],
		sum[12],
		w1[12]
	);
	
	OneBitFullAdder adder14(
		a[13],
		b[13],
		w1[12],
		sum[13],
		w1[13]
	);
	
	OneBitFullAdder adder15(
		a[14],
		b[14],
		w1[13],
		sum[14],
		w1[14]
	);
	
	OneBitFullAdder adder16(
		a[15],
		b[15],
		w1[14],
		sum[15],
		w1[15]
	);
	
	OneBitFullAdder adder17(
		a[16],
		b[16],
		w1[15],
		sum[16],
		w1[16]
	);
	
	OneBitFullAdder adder18(
		a[17],
		b[17],
		w1[16],
		sum[17],
		c_out
	);
	
	
endmodule 