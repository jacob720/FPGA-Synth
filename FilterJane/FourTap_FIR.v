module FourTap_FIR(
	input clk,
	input [19:0] in,
	input [15:0] h0,
	input [15:0] h1,
	input [15:0] h2,
	input [15:0] h3,
	output [19:0] out // to do - figure out how to get enable to allow signal to travel through
);

wire [19:0] z0;
wire [19:0] z1;
wire [19:0] z2;
wire [19:0] z3;

wire [19:0] add_out0;
wire [19:0] add_out1;
wire [19:0] add_out2;

reg [19:0] mult0;

always @ (h0 or in) begin
	mult0 <= in * h0;
end

Delay_20bit delay(
	clk,
	in,
	z0
);

Tap t0(
	clk,
	z0,
	h1,
	mult0,
	z1,
	add_out0
);

Tap t1(
	clk,
	z1,
	h2,
	add_out0,
	z2,
	add_out1
);

Tap t2(
	clk,
	z2,
	h3,
	add_out1,
	z3,
	out
);




endmodule