/* PhaseAccumulator.v

By: Jacob Williamson

Module Description:
A module to increment the phase of a waveform every clock cycle.
Units of phase are mapped to 0 - 2^32-1. 
To convert to radians, calculate: phase * (2PI / (2^32-1)).

Inputs:
clk - clock signal driving the module.
reset - reset bit to set phase to 0.
phase_step - how much the phase with increment every clock cycle.


Outputs:
phase - the phase.

*/

module PhaseAccumulator(
	input clk,
	input reset,
	input [31:0] phase_step,
	output reg [36:0] phase
);

	wire [36:0] w1;
	wire w2;

	
	ThirtySevenBitFullAdder adder(
		{5'b00000, phase_step},
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
