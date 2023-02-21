module Multiplexer_5bit(
	input [4:0] a,
	input [4:0] b,
	input sel,
	output [4:0] out
);

Multiplexer mux0(
	a[0],
	b[0],
	sel,
	out[0]
);

Multiplexer mux1(
	a[1],
	b[1],
	sel,
	out[1]
);

Multiplexer mux2(
	a[2],
	b[2],
	sel,
	out[2]
);

Multiplexer mux3(
	a[3],
	b[3],
	sel,
	out[3]
);

Multiplexer mux4(
	a[4],
	b[4],
	sel,
	out[4]
);



endmodule
