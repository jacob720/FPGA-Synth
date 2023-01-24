module HalfSubtractor(
	input A,
	input B,
	output diff,
	output borrow
);

wire w1;

xor(diff,A,B);
not(w1,A);
and(borrow,w1,B);

endmodule