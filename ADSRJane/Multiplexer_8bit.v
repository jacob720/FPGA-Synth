module Multiplexer_8bit(
	input [7:0] a,
	input [7:0] b,
	input sel,
	output [7:0] out
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

Multiplexer mux5(
	a[5],
	b[5],
	sel,
	out[5]
);

Multiplexer mux6(
	a[6],
	b[6],
	sel,
	out[6]
);

Multiplexer mux7(
	a[7],
	b[7],
	sel,
	out[7]
);



endmodule
