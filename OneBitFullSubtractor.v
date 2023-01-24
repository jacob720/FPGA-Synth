module OneBitFullSubtractor(
	input a,
	input b,
	input borrow_in,
	output diff,
	output borrow_out
);

wire diff1;
wire b1;
wire b2;

HalfSubtractor sub1(
	a,
	b,
	diff1,
	b1
);


HalfSubtractor sub2(
	diff1,
	borrow_in,
	diff,
	b2
);

or(borrow_out,b1,b2);


endmodule