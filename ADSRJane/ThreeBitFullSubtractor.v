// the result is in 1s complement - MSB is sign bit, the result is the magnitude of inverted remaining bits + borrow_out
//input is unsigned?
module ThreeBitFullSubtractor(
	input [2:0]a,
	input [2:0]b,
	input b_in,
	output [2:0]diff,
	output b_out
);

	wire [1:0] w1;

	OneBitFullSubtractor Subtractor1(
		a[0],
		b[0],
		b_in,
		diff[0],
		w1[0]
	);
	
	OneBitFullSubtractor Subtractor2(
		a[1],
		b[1],
		w1[0],
		diff[1],
		w1[1]
	);
	
	OneBitFullSubtractor Subtractor3(
		a[2],
		b[2],
		w1[1],
		diff[2],
		b_out
	);
	
endmodule