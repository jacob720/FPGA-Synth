/* SineTable.v

By: Jacob Williamson

Module Description:
A table containing a quarter of a sine wave.

Inputs:
phase [7:0] - phase of the sinewave.

Outputs:
sinewave [15:0] - the sinewave.

*/

module SineTable(
	input [5:0] phase,
	output reg [15:0] sinewave
);

	always @(phase) begin
	
		case(phase)
					
			6'h00: sinewave <= 16'h8192;
			6'h01: sinewave <= 16'h84B6;
			6'h02: sinewave <= 16'h87D9;
			6'h03: sinewave <= 16'h8AFB;
			6'h04: sinewave <= 16'h8E1B;
			6'h05: sinewave <= 16'h9139;
			6'h06: sinewave <= 16'h9455;
			6'h07: sinewave <= 16'h976D;
			6'h08: sinewave <= 16'h9A82;
			6'h09: sinewave <= 16'h9D93;
			6'h0A: sinewave <= 16'hA09F;
			6'h0B: sinewave <= 16'hA3A6;
			6'h0C: sinewave <= 16'hA6A7;
			6'h0D: sinewave <= 16'hA9A3;
			6'h0E: sinewave <= 16'hAC98;
			6'h0F: sinewave <= 16'hAF87;
			6'h10: sinewave <= 16'hB26E;
			6'h11: sinewave <= 16'hB54D;
			6'h12: sinewave <= 16'hB824;
			6'h13: sinewave <= 16'hBAF2;
			6'h14: sinewave <= 16'hBDB7;
			6'h15: sinewave <= 16'hC073;
			6'h16: sinewave <= 16'hC325;
			6'h17: sinewave <= 16'hC5CC;
			6'h18: sinewave <= 16'hC869;
			6'h19: sinewave <= 16'hCAFB;
			6'h1A: sinewave <= 16'hCD81;
			6'h1B: sinewave <= 16'hCFFB;
			6'h1C: sinewave <= 16'hD268;
			6'h1D: sinewave <= 16'hD4C9;
			6'h1E: sinewave <= 16'hD71D;
			6'h1F: sinewave <= 16'hD964;
			6'h20: sinewave <= 16'hDB9C;
			6'h21: sinewave <= 16'hDDC7;
			6'h22: sinewave <= 16'hDFE3;
			6'h23: sinewave <= 16'hE1F0;
			6'h24: sinewave <= 16'hE3EE;
			6'h25: sinewave <= 16'hE5DD;
			6'h26: sinewave <= 16'hE7BC;
			6'h27: sinewave <= 16'hE98B;
			6'h28: sinewave <= 16'hEB4A;
			6'h29: sinewave <= 16'hECF8;
			6'h2A: sinewave <= 16'hEE96;
			6'h2B: sinewave <= 16'hF022;
			6'h2C: sinewave <= 16'hF19D;
			6'h2D: sinewave <= 16'hF307;
			6'h2E: sinewave <= 16'hF45F;
			6'h2F: sinewave <= 16'hF5A5;
			6'h30: sinewave <= 16'hF6D8;
			6'h31: sinewave <= 16'hF7FA;
			6'h32: sinewave <= 16'hF909;
			6'h33: sinewave <= 16'hFA05;
			6'h34: sinewave <= 16'hFAEE;
			6'h35: sinewave <= 16'hFBC5;
			6'h36: sinewave <= 16'hFC88;
			6'h37: sinewave <= 16'hFD39;
			6'h38: sinewave <= 16'hFDD5;
			6'h39: sinewave <= 16'hFE5F;
			6'h3A: sinewave <= 16'hFED5;
			6'h3B: sinewave <= 16'hFF37;
			6'h3C: sinewave <= 16'hFF86;
			6'h3D: sinewave <= 16'hFFC1;
			6'h3E: sinewave <= 16'hFFE9;
			6'h3F: sinewave <= 16'hFFFD;
				
		endcase
	
	end

endmodule
			