module DecreasingScalar(
	input clk,
	input reset_n, // !note_on
	output [4:0]scalar_out
);


BinaryCountdown_5bit counter(
	clk,
	reset_n,
	scalar_out
);



endmodule