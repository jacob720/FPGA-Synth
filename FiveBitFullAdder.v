module FiveBitFullAdder (
	
	input [4:0] a,
	input [4:0] b,
	input c_in,
	
	output [4:0] sum,
	output c_out
	
);

	wire [3:0] w1;

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
		c_out
	);


endmodule
