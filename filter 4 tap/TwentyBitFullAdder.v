module TwentyBitFullAdder (
	
	input [19:0] a,
	input [19:0] b,
	input c_in,
	output [19:0] out,
	output c_out
	
);

	wire [2:0] w1;

	FiveBitFullAdder Adder1(
		a[4:0],
		b[4:0],
		c_in,
		out[4:0],
		w1[0]
	);
	
	FiveBitFullAdder Adder2(
		a[9:5],
		b[9:5],
		w1[0],
		out[9:5],
		w1[1]
	);
	
	FiveBitFullAdder Adder3(
		a[14:10],
		b[14:10],
		w1[1],
		out[14:10],
		w1[2]
	);
	
	FiveBitFullAdder Adder4(
		a[19:15],
		b[19:15],
		w1[2],
		out[19:15],
		c_out
	);

endmodule