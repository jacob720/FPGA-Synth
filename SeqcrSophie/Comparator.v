module Comparator (

	input clk,
	input [18:0] Cin,
	output reg clk100_hz


);

	always @ (posedge clk) begin

			if (Cin >= 19'b0111101000010010000) //when greater than 250,000 (but les than 500 000, as it resets there), tick - creating clock pulse
				clk100_hz = 1'b0;

			else 
				clk100_hz = 1'b1;  //therefore when timeOut = x, intialises as 1, not causing a pos edge
	end


endmodule
