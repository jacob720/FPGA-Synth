module BinaryCounter_4bit (
	input clk,
	input reset,
	input [3:0]reset_value,
	output [3:0]count
); // will only reset to zero on if reset high on posedge clk

wire [3:0] add_b;
wire [3:0] add_out;
wire [3:0] add_in;
wire [3:0] add_in_2;
wire [3:0] reset_out;
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

Multiplexer_4bit mux1( 
	4'b0001,
	4'b0000,
	reset,
	add_b
);

DTypeFF dff19(
	clk,
	add_b[0],
	add_in[0]
);

DTypeFF dff20(
	clk,
	add_b[1],
	add_in[1]
);

DTypeFF dff21(
	clk,
	add_b[2],
	add_in[2]
);

DTypeFF dff22(
	clk,
	add_b[3],
	add_in[3]
);



FourBitFullAdder adder(
	add_in,
	add_in_2,
	1'b0,
	add_out,
	c_out
);

Multiplexer_4bit mux0(
	add_out,
	reset_value,
	reset,
	reset_out
);

//Multiplexer_4bit mux0(
//	add_out,
//	4'b0000,
//	reset,
//	reset_out
//);

assign count = reset_out;

endmodule
