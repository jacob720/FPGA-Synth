/* Oscillator.v

By: Jacob Williamson

Module Description:
A module produce a sine, saw or square wave output.

Inputs:
clk - clock signal driving the module.
freq - frequency in Hz of the waves.
ctrl - control bits to determine which waveform is produced.
reset - reset bit to set phase of wave to 0.

Outputs:
wave [15:0] - the wave.

*/

module Oscillator(
	input clk,
	input [19:0] freq,
	input [1:0] ctrl,
	input reset,
	output reg [15:0] wave
);

	wire [27:0] phase_step;
	wire [31:0] phase;
	wire [15:0] sine;
	wire [15:0] half_triangle;
	wire useless;
	
	TwentyBitMultiplier multiplier(
		freq,
		8'b01010110,
		phase_step
	);

	PhaseAccumulator accumulator(
		clk,
		{4'b0000, phase_step},
		reset,
		phase
	);
	
	SineLookup sine_lookup(
		phase[31:24],
		sine
	);
	
	always @ (posedge clk) begin
		case(ctrl)
			2'b00:
				wave <= phase[31:16];        // saw wave
			2'b01:
				wave <= {16{phase[31]}}; 	  // square wave
			2'b10:
				wave <= sine;				     // sine wave
			2'b11:
				if (phase[31]) begin
					wave <= ~phase[30:15];    // triangle wave
				end else begin
					wave <= phase[30:15];
				end
		endcase
	end
		
endmodule 