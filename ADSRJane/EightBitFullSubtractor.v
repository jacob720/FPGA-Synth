module EightBitFullSubtractor (
	
	input [7:0] a,
	input [7:0] b,
	
	output [7:0] diff,
	output b_out
	
);

	wire [1:0] w1;
	
	HalfSubtractor Subtractor1 (
		a[0],
		b[0],
		diff[0],
		w1[0]
		);
	
	ThreeBitFullSubtractor Subtractor2 (
		a[3:1],
		b[3:1],
		w1[0],
		diff[3:1],
		w1[1]
		);
	
	FourBitFullSubtractor Subtractor3 (
		a[7:4],
		b[7:4],
		w1[1],
		diff[7:4],
		b_out
		);
	
endmodule
