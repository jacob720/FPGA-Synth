/* OscillatorSingle.v

By: Jacob Williamson

Module Description:
A module produce a sine, saw or square wave output.

Inputs:
clk - clock signal driving the module.
reset - reset nit to set phase of wave to 0.
phase_step - amount phase increments every clock cycle.
ctrl - control bits to determine which waveform is produced.
		00 -> saw
		01 -> square
		10 -> sine
		11 -> triangle

Outputs:
wave [15:0] - the wave.

*/

module OscillatorSingle(
	input clk,
	input reset,
	input [31:0] phase_step,
	input [1:0] ctrl,
	output reg [15:0] wave
);

	wire [36:0] phase;
	wire [15:0] sine;
	wire [15:0] half_triangle;
	wire useless;
	

	PhaseAccumulator accumulator(
		clk,
		reset,
		phase_step,
		phase
	);
	
	SineLookup sine_lookup(
		phase[36:29],
		sine
	);
	
	always @ (posedge clk) begin
		case(ctrl)
			2'b00:
				wave <= phase[36:21];        // saw wave
			2'b01:
				wave <= {16{phase[36]}}; 	  // square wave
			2'b10:
				wave <= sine;				     // sine wave
			2'b11: begin
				if (phase[36]) begin
					wave <= ~phase[35:20];    // triangle wave
				end else begin
					wave <= phase[35:20];
				end
			end
		endcase
	end
		
endmodule 