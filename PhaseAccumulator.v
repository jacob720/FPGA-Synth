/* PhaseAccumulator.v

By: Jacob Williamson

Module Description:
A module to increment the phase of a waveform every clock cycle.
Units of phase are mapped to 0 - 2^32-1. 
To convert to radians, calculate: phase * (2PI / (2^32-1)).

Inputs:
clk - clock signal driving the module.
phase_step - how much the phase with increment every clock cycle.
reset - reset bit to set phase to 0.

Outputs:
phase - the phase.

*/

module PhaseAccumulator(
	input clk,
	input [31:0] phase_step,
	input reset,
	output reg [31:0] phase
);

	wire [31:0] w1;
	wire w2;

	
	ThirtyTwoBitFullAdder adder(
		phase_step,
		phase,
		1'b0,
		w1,
		w2
	);
	
	always @ (posedge clk or posedge reset) begin
		if (reset) begin
			phase = 0;
		end else begin
			phase = w1;
		end
	end
	

endmodule
