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
	input [7:0] phase,
	output reg [15:0] sinewave
);

	always @(phase) begin
	
		case(phase)
		
		8'h00: sinewave <= 16'h8000;
		8'h01: sinewave <= 16'h8324;
		8'h02: sinewave <= 16'h8647;
		8'h03: sinewave <= 16'h896A;
		8'h04: sinewave <= 16'h8C8B;
		8'h05: sinewave <= 16'h8FAB ;
		8'h06: sinewave <= 16'h92C7 ;
		8'h07: sinewave <= 16'h95E1 ;
		8'h08: sinewave <= 16'h98F8 ;
		8'h09: sinewave <= 16'h9C0B ;
		8'h0A: sinewave <= 16'h9F19 ;
		8'h0B: sinewave <= 16'hA223 ;
		8'h0C: sinewave <= 16'hA527 ;
		8'h0D: sinewave <= 16'hA826 ;
		8'h0E: sinewave <= 16'hAB1F ;
		8'h0F: sinewave <= 16'hAE10 ;
		8'h10: sinewave <= 16'hB0FB ;
		8'h11: sinewave <= 16'hB3DE ;
		8'h12: sinewave <= 16'hB6B9 ;
		8'h13: sinewave <= 16'hB98C ;
		8'h14: sinewave <= 16'hBC56 ;
		8'h15: sinewave <= 16'hBF17 ;
		8'h16: sinewave <= 16'hC1CD ;
		8'h17: sinewave <= 16'hC47A ;
		8'h18: sinewave <= 16'hC71C ;
		8'h19: sinewave <= 16'hC9B3 ;
		8'h1A: sinewave <= 16'hCC3F ;
		8'h1B: sinewave <= 16'hCEBF ;
		8'h1C: sinewave <= 16'hD133 ;
		8'h1D: sinewave <= 16'hD39A ;
		8'h1E: sinewave <= 16'hD5F5 ;
		8'h1F: sinewave <= 16'hD842 ;
		8'h20: sinewave <= 16'hDA82 ;
		8'h21: sinewave <= 16'hDCB3 ;
		8'h22: sinewave <= 16'hDED7 ;
		8'h23: sinewave <= 16'hE0EB ;
		8'h24: sinewave <= 16'hE2F1 ;
		8'h25: sinewave <= 16'hE4E8 ;
		8'h26: sinewave <= 16'hE6CF ;
		8'h27: sinewave <= 16'hE8A6 ;
		8'h28: sinewave <= 16'hEA6D ;
		8'h29: sinewave <= 16'hEC23 ;
		8'h2A: sinewave <= 16'hEDC9 ;
		8'h2B: sinewave <= 16'hEF5E ;
		8'h2C: sinewave <= 16'hF0E2 ;
		8'h2D: sinewave <= 16'hF254 ;
		8'h2E: sinewave <= 16'hF3B5 ;
		8'h2F: sinewave <= 16'hF504 ;
		8'h30: sinewave <= 16'hF641 ;
		8'h31: sinewave <= 16'hF76B ;
		8'h32: sinewave <= 16'hF884 ;
		8'h33: sinewave <= 16'hF989 ;
		8'h34: sinewave <= 16'hFA7C ;
		8'h35: sinewave <= 16'hFB5C ;
		8'h36: sinewave <= 16'hFC29 ;
		8'h37: sinewave <= 16'hFCE3 ;
		8'h38: sinewave <= 16'hFD89 ;
		8'h39: sinewave <= 16'hFE1D ;
		8'h3A: sinewave <= 16'hFE9C ;
		8'h3B: sinewave <= 16'hFF09 ;
		8'h3C: sinewave <= 16'hFF61 ;
		8'h3D: sinewave <= 16'hFFA6 ;
		8'h3E: sinewave <= 16'hFFD8 ;
		8'h3F: sinewave <= 16'hFFF5 ;
		8'h40: sinewave <= 16'hFFFF ;
				
		endcase
	
	end

endmodule
			