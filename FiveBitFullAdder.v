module FiveBitFullAdder(
	input [4:0] a,
	input [4:0] b,
	output [4:0] sum,
	output c_out
);

wire w1;

	OneBitHalfAdder adder1 (
		a[0],
		b[0],
		sum[0],
		w1
		);
	
	FourBitFullAdder adder2 (
		a[4:1],
		b[4:1],
		w1,
		sum[4:1],
		c_out
		);

endmodule