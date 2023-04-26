module BinaryCountdown_5bit (
	input clk,
	input reset,
	output [4:0]count
); 

wire [4:0] sub_b;
wire [4:0] sub_out;
wire [4:0] sub_in;
wire [4:0] sub_in_2;
wire [4:0] reset_out;
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

DTypeFF dff4(
	clk,
	reset_out[4],
	sub_in_2[4]
);

Multiplexer_5bit mux1( 
	5'b00001,
	5'b00000,
	reset,
	sub_b
);


DTypeFF dff5(
	clk,
	sub_b[0],
	sub_in[0]
);

DTypeFF dff6(
	clk,
	sub_b[1],
	sub_in[1]
);

DTypeFF dff7(
	clk,
	sub_b[2],
	sub_in[2]
);

DTypeFF dff8(
	clk,
	sub_b[3],
	sub_in[3]
);

DTypeFF dff9(
	clk,
	sub_b[4],
	sub_in[4]
);



FiveBitFullSubtractor subtractor(
	sub_in_2,
	sub_in,
	1'b0,
	sub_out,
	diff
);

Multiplexer_5bit mux0(
	sub_out,
	5'b10100, // 20
	reset,
	reset_out
);

assign count = reset_out;

endmodule
