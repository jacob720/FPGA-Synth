module BinaryCountdown_4bit (
	input clk,
	input reset,
	output [3:0]count
); 

wire [3:0] sub_b;
wire [3:0] sub_out;
wire [3:0] sub_in;
wire [3:0] sub_in_2;
wire [3:0] reset_out;
wire diff;



DTypeFF dff0(
	clk,
	reset_out[0],
	sub_in_2[0]
);

DTypeFF dff1(
	clk,
	reset_out[1],
	sub_in_2[1]
);

DTypeFF dff2(
	clk,
	reset_out[2],
	sub_in_2[2]
);

DTypeFF dff3(
	clk,
	reset_out[3],
	sub_in_2[3]
);

Multiplexer_4bit mux1( // change to 4 bit mux
	4'b0001,
	4'b0000,
	reset,
	sub_b
);


DTypeFF dff19(
	clk,
	sub_b[0],
	sub_in[0]
);

DTypeFF dff20(
	clk,
	sub_b[1],
	sub_in[1]
);

DTypeFF dff21(
	clk,
	sub_b[2],
	sub_in[2]
);

DTypeFF dff22(
	clk,
	sub_b[3],
	sub_in[3]
);



FourBitFullSubtractor subtractor(
	sub_in_2,
	sub_in,
	1'b0,
	sub_out,
	diff
);

Multiplexer_4bit mux0(
	sub_out,
	4'b1000,
	reset,
	reset_out
);

assign count = reset_out;

endmodule
