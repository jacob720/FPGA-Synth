//taken from here
// https://stackoverflow.com/questions/40902637/how-to-write-to-inout-port-and-read-from-inout-port-of-the-same-module


module TriStateDriver16bit(
	input nWRITE,
	input [15:0] DataIn,
	
	output [15:0] DataOut,
	
	inout [15:0] IOport
);

assign IOport = nWRITE ? 16'hzzzz : DataIn ; // To drive the inout net
assign DataOut = IOport; // To read from inout net


endmodule
