/* FreqLookup.v

By: Jacob Williamson

Module Description:
A lookup table containing the frequencies of notes.

Inputs:
note [6:0] - The number of the note needed. C0 = 0, C#0 = 1 etc.

Outputs:
frequency [19:0] - The frequency of the note, x32 
(last 5 bits are after a binary point, allowing for better precision)

*/

module FreqLookup(
	input [6:0] note,
	output reg [19:0] frequency
);

	always @(note) begin
	    
		case(note)
		
			7'h00: frequency <= 20'h0020B;  // C0
			7'h01: frequency <= 20'h0022A;  // C#0
			7'h02: frequency <= 20'h0024B;  // D0
			7'h03: frequency <= 20'h0026E;  // D#0
			7'h04: frequency <= 20'h00293;  // E0
			7'h05: frequency <= 20'h002BA;  // F0
			7'h06: frequency <= 20'h002E4;  // F#0
			7'h07: frequency <= 20'h00310;  // G0
			7'h08: frequency <= 20'h0033F;  // G#0
			7'h09: frequency <= 20'h00370;  // A0
			7'h0A: frequency <= 20'h003A4;  // A#0
			7'h0B: frequency <= 20'h003DC;  // B0
			7'h0C: frequency <= 20'h00417;  // C1
			7'h0D: frequency <= 20'h00455;  // C#1
			7'h0E: frequency <= 20'h00497;  // D1
			7'h0F: frequency <= 20'h004DD;  // D#1
			7'h10: frequency <= 20'h00527;  // E1
			7'h11: frequency <= 20'h00575;  // F1
			7'h12: frequency <= 20'h005C8;  // F#1
			7'h13: frequency <= 20'h00620;  // G1
			7'h14: frequency <= 20'h0067D;  // G#1
			7'h15: frequency <= 20'h006E0;  // A1
			7'h16: frequency <= 20'h00749;  // A#1
			7'h17: frequency <= 20'h007B8;  // B1
			7'h18: frequency <= 20'h0082D;  // C2
			7'h19: frequency <= 20'h008A9;  // C#2
			7'h1A: frequency <= 20'h0092D;  // D2
			7'h1B: frequency <= 20'h009B9;  // D#2
			7'h1C: frequency <= 20'h00A4D;  // E2
			7'h1D: frequency <= 20'h00AEA;  // F2
			7'h1E: frequency <= 20'h00B90;  // F#2
			7'h1F: frequency <= 20'h00C40;  // G2
			7'h20: frequency <= 20'h00CFA;  // G#2
			7'h21: frequency <= 20'h00DC0;  // A2
			7'h22: frequency <= 20'h00E91;  // A#2
			7'h23: frequency <= 20'h00F6F;  // B2
			7'h24: frequency <= 20'h0105A;  // C3
			7'h25: frequency <= 20'h01153;  // C#3
			7'h26: frequency <= 20'h0125B;  // D3
			7'h27: frequency <= 20'h01372;  // D#3
			7'h28: frequency <= 20'h0149A;  // E3
			7'h29: frequency <= 20'h015D4;  // F3
			7'h2A: frequency <= 20'h01720;  // F#3
			7'h2B: frequency <= 20'h01880;  // G3
			7'h2C: frequency <= 20'h019F5;  // G#3
			7'h2D: frequency <= 20'h01B80;  // A3
			7'h2E: frequency <= 20'h01D23;  // A#3
			7'h2F: frequency <= 20'h01EDE;  // B3
			7'h30: frequency <= 20'h020B4;  // C4
			7'h31: frequency <= 20'h022A6;  // C#4
			7'h32: frequency <= 20'h024B5;  // D4
			7'h33: frequency <= 20'h026E4;  // D#4
			7'h34: frequency <= 20'h02934;  // E4
			7'h35: frequency <= 20'h02BA7;  // F4
			7'h36: frequency <= 20'h02E40;  // F#4
			7'h37: frequency <= 20'h03100;  // G4
			7'h38: frequency <= 20'h033EA;  // G#4
			7'h39: frequency <= 20'h03700;  // A4
			7'h3A: frequency <= 20'h03A45;  // A#4
			7'h3B: frequency <= 20'h03DBC;  // B4
			7'h3C: frequency <= 20'h04168;  // C5
			7'h3D: frequency <= 20'h0454C;  // C#5
			7'h3E: frequency <= 20'h0496B;  // D5
			7'h3F: frequency <= 20'h04DC8;  // D#5
			7'h40: frequency <= 20'h05268;  // E5
			7'h41: frequency <= 20'h0574F;  // F5
			7'h42: frequency <= 20'h05C80;  // F#5
			7'h43: frequency <= 20'h06200;  // G5
			7'h44: frequency <= 20'h067D4;  // G#5
			7'h45: frequency <= 20'h06E00;  // A5
			7'h46: frequency <= 20'h0748A;  // A#5
			7'h47: frequency <= 20'h07B79;  // B5
			7'h48: frequency <= 20'h082D0;  // C6
			7'h49: frequency <= 20'h08A97;  // C#6
			7'h4A: frequency <= 20'h092D5;  // D6
			7'h4B: frequency <= 20'h09B90;  // D#6
			7'h4C: frequency <= 20'h0A4D0;  // E6
			7'h4D: frequency <= 20'h0AE9D;  // F6
			7'h4E: frequency <= 20'h0B8FF;  // F#6
			7'h4F: frequency <= 20'h0C3FF;  // G6
			7'h50: frequency <= 20'h0CFA7;  // G#6
			7'h51: frequency <= 20'h0DC00;  // A6
			7'h52: frequency <= 20'h0E915;  // A#6
			7'h53: frequency <= 20'h0F6F1;  // B6
			7'h54: frequency <= 20'h105A0;  // C7
			7'h55: frequency <= 20'h1152F;  // C#7
			7'h56: frequency <= 20'h125AA;  // D7
			7'h57: frequency <= 20'h13721;  // D#7
			7'h58: frequency <= 20'h149A1;  // E7
			7'h59: frequency <= 20'h15D3A;  // F7
			7'h5A: frequency <= 20'h171FF;  // F#7
			7'h5B: frequency <= 20'h187FF;  // G7
			7'h5C: frequency <= 20'h19F4E;  // G#7
			7'h5D: frequency <= 20'h1B800;  // A7
			7'h5E: frequency <= 20'h1D22A;  // A#7
			7'h5F: frequency <= 20'h1EDE2;  // B7
			7'h60: frequency <= 20'h20B40;  // C8
			7'h61: frequency <= 20'h22A5E;  // C#8
			7'h62: frequency <= 20'h24B54;  // D8
			7'h63: frequency <= 20'h26E41;  // D#8
			7'h64: frequency <= 20'h29341;  // E8
			7'h65: frequency <= 20'h2BA75;  // F8
			7'h66: frequency <= 20'h2E3FD;  // F#8
			7'h67: frequency <= 20'h30FFE;  // G8
			7'h68: frequency <= 20'h33E9C;  // G#8
			7'h69: frequency <= 20'h37000;  // A8
			7'h6A: frequency <= 20'h3A454;  // A#8
			7'h6B: frequency <= 20'h3DBC4;  // B8
			7'h6C: frequency <= 20'h41681;  // C9
			7'h6D: frequency <= 20'h454BB;  // C#9
			7'h6E: frequency <= 20'h496A9;  // D9
			7'h6F: frequency <= 20'h4DC82;  // D#9
			7'h70: frequency <= 20'h52683;  // E9
			7'h71: frequency <= 20'h574EA;  // F9
			7'h72: frequency <= 20'h5C7FA;  // F#9
			7'h73: frequency <= 20'h61FFB;  // G9
			7'h74: frequency <= 20'h67D38;  // G#9
			7'h75: frequency <= 20'h6E000;  // A9
			7'h76: frequency <= 20'h748A8;  // A#9
			7'h77: frequency <= 20'h7B789;  // B9
			7'h78: frequency <= 20'h82D01;  // C10
			7'h79: frequency <= 20'h8A976;  // C#10
			7'h7A: frequency <= 20'h92D51;  // D10
			7'h7B: frequency <= 20'h9B904;  // D#10
			7'h7C: frequency <= 20'hA4D05;  // E10
			7'h7D: frequency <= 20'hAE9D3;  // F10
			7'h7E: frequency <= 20'hB8FF5;  // F#10
			7'h7F: frequency <= 20'hC3FF7;  // G10

		endcase
		
	end
	
endmodule 
