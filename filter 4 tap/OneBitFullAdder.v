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
	or(c_out, w3,w2);
	

endmodule