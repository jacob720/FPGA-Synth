module Multiplexer20bit(
	input [19:0] a,
	input [19:0] b,
	input sel,
	output [19:0] out
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

Multiplexer mux8(
	a[8],
	b[8],
	sel,
	out[8]
);

Multiplexer mux9(
	a[9],
	b[9],
	sel,
	out[9]
);

Multiplexer mux10(
	a[10],
	b[10],
	sel,
	out[10]
);

Multiplexer mux11(
	a[11],
	b[11],
	sel,
	out[11]
);

Multiplexer mux12(
	a[12],
	b[12],
	sel,
	out[12]
);

Multiplexer mux13(
	a[13],
	b[13],
	sel,
	out[13]
);

Multiplexer mux14(
	a[14],
	b[14],
	sel,
	out[14]
);

Multiplexer mux15(
	a[15],
	b[15],
	sel,
	out[15]
);

Multiplexer mux16(
	a[16],
	b[16],
	sel,
	out[16]
);

Multiplexer mux17(
	a[17],
	b[17],
	sel,
	out[17]
);

Multiplexer mux18(
	a[18],
	b[18],
	sel,
	out[18]
);

Multiplexer mux19(
	a[19],
	b[19],
	sel,
	out[19]
);



endmodule
