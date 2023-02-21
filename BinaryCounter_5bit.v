module BinaryCounter_5bit (
	input clk,
	input reset,
	input [4:0]reset_value,
	output [4:0]count
); // will only reset to zero on if reset high on posedge clk

wire [4:0] add_b;
wire [4:0] add_out;
wire [4:0] add_in;
wire [4:0] add_in_2;
wire [4:0] reset_out;
wire c_out;


DTypeFF dff0(
	clk,
	reset_out[0],
	add_in_2[0]
);

DTypeFF dff1(
	clk,
	reset_out[1],
	add_in_2[1]
);

DTypeFF dff2(
	clk,
	reset_out[2],
	add_in_2[2]
);

DTypeFF dff3(
	clk,
	reset_out[3],
	add_in_2[3]
);

DTypeFF dff4(
	clk,
	reset_out[4],
	add_in_2[4]
);

Multiplexer_5bit mux1( 
	5'b00001,
	5'b00000,
	reset,
	add_b
);

DTypeFF dff5(
	clk,
	add_b[0],
	add_in[0]
);

DTypeFF dff6(
	clk,
	add_b[1],
	add_in[1]
);

DTypeFF dff7(
	clk,
	add_b[2],
	add_in[2]
);

DTypeFF dff8(
	clk,
	add_b[3],
	add_in[3]
);

DTypeFF dff9(
	clk,
	add_b[4],
	add_in[4]
);



FiveBitFullAdder adder(
	add_in,
	add_in_2,
	1'b0,
	add_out,
	c_out
);

Multiplexer_5bit mux0(
	add_out,
	reset_value,
	reset,
	reset_out
);


assign count = reset_out;

endmodule
