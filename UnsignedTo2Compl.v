module UnsignedTo2Compl(
	input [22:0] UIntDATA,
	
	output [24:0] TwosComplementDATA
);

//initially,
assign TwosComplementDATA[23] = 1'b0;
assign TwosComplementDATA[22:0] = UIntDATA;


endmodule
