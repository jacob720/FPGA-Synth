module Multiplexer40bit(
	input [39:0] a,
	input [39:0] b,
	input sel,
	output [39:0] out
);

Multiplexer20bit mux0(
	a[39:20],
	b[39:20],
	sel,
	out[39:20]
);


Multiplexer20bit mux1(
	a[19:0],
	b[19:0],
	sel,
	out[19:0]
);

endmodule