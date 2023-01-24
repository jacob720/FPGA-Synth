module FourBitFullSubtractor (
	
	input [3:0] a,
	input [3:0] b,
	input b_in,
	
	output [3:0] diff,
	output b_out
	
);

	wire [2:0] w1;

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
		w1[2]
	);
	
	OneBitFullSubtractor Subtractor4(
		a[3],
		b[3],
		w1[2],
		diff[3],
		b_out
	);

endmodule