//taken from here
// https://stackoverflow.com/questions/40902637/how-to-write-to-inout-port-and-read-from-inout-port-of-the-same-module


module TriStateDriver(
	input write,
	input DataIn,
	
	output DataOut,
	
	inout IOport
);

assign IOport = write ? DataIn : 1'bz; // To drive the inout net
assign DataOut = IOport; // To read from inout net


endmodule
