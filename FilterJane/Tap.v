// input will be signed 2s complement
// adder in and out might have to be adjusted in width to avoid overflow


module Tap(
	input clk,
	input [19:0]in,
	input [15:0]h,
	input [19:0]adder_in,
	output [19:0]delay_out,
	output [19:0]adder_out
);

reg [19:0] multiplier;
wire [19:0] delayed_signal;
wire w;

assign delay_out = delayed_signal;

Delay_20bit delay(
	clk,
	in,
	delayed_signal
);

always @ (h or delayed_signal) begin

		multiplier <= h * delayed_signal;

end

TwentyBitFullAdder adder(
	multiplier,
	adder_in,
	1'b0,
	adder_out,
	w
);



endmodule

// implement wih + and x
// c in and c out include