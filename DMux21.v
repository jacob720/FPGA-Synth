//Demux
//adapted by sophie watson
//23/01/23
//using diagram from https://www.electronicshub.org/demultiplexerdemux/

module DMux21(

	input IN,
	input sel,
	output wire Y0OUT,
	output wire Y1OUT

);


wire x;

	and and1(Y0OUT, x, IN);
	and and2(Y1OUT, sel,IN);
	not not1(x, sel);


endmodule
