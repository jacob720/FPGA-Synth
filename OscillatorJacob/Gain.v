/* Gain.v

By: Jacob Williamson

Module Description:
An eight bit full adder module

Inputs:
clk - clock
wave [19:0] - The wave
gain [7:0] - The gain (8'hFF = -0 Db, 8'h00 = -inf Db)

Outputs:
new_wave [19:0] - The wave after gain has been applied.

*/

module Gain(
	input clk,
	input [19:0] wave_in,
	input [7:0] gain,
	output reg [19:0] wave_out
);

	wire [27:0] product;
	
	TwentyBitMultiplier multiplier(
		wave_in,
		gain,
		product
	);
	
	always @(posedge clk) begin
		wave_out <= product[27:8];
	end
	
endmodule

