module UnsignedTo2sCompl20Bit(
	input [19:0] DATAUnsigned,
	output [19:0] DATATwosCompl
);

assign DATATwosCompl[18:0] = DATAUnsigned[18:0];
assign DATATwosCompl[19] = ~DATAUnsigned[19];

endmodule
