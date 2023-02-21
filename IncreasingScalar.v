//increases from 0 to target_scalar
module IncreasingScalar(
	input clk,
	input reset, 
	input [4:0] reset_value,
	output [4:0]scalar_out
);

BinaryCounter_5bit counter(
	clk,
	reset,
	reset_value,
	scalar_out
);



endmodule