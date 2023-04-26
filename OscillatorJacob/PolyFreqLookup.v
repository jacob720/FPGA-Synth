/* PolyFreqLookup.v

By: Jacob Williamson

Module Description:
A lookup table containing the frequencies of notes.

Inputs:
clk - The clock.
reset - Reset.
note1 [6:0] - Note 1. C0 = 0, C#0 = 1 etc.
note2 [6:0] - Note 2.
note3 [6:0] - Note 3.
note4 [6:0] - Note 4.
note5 [6:0] - Note 5.
note6 [6:0] - Note 6.
note7 [6:0] - Note 7.
note8 [6:0] - Note 8.
note9 [6:0] - Note 9.
note10 [6:0] - Note 10.
note11 [6:0] - Note 11.
note12 [6:0] - Note 12.
note13 [6:0] - Note 13.
note14 [6:0] - Note 14.
note15 [6:0] - Note 15.
note16 [6:0] - Note 16.

Outputs:
frequency1 [19:0] - The frequency of note1, x32 (last 5 bits are powers of 0.5).
frequency2 [19:0] - The frequency of note2.
frequency3 [19:0] - The frequency of note3.
frequency4 [19:0] - The frequency of note4.
frequency5 [19:0] - The frequency of note5.
frequency6 [19:0] - The frequency of note6.
frequency7 [19:0] - The frequency of note7.
frequency8 [19:0] - The frequency of note8.
frequency9 [19:0] - The frequency of note9.
frequency10 [19:0] - The frequency of note10.
frequency11 [19:0] - The frequency of note11.
frequency12 [19:0] - The frequency of note12.
frequency13 [19:0] - The frequency of note13.
frequency14 [19:0] - The frequency of note14.
frequency15 [19:0] - The frequency of note15.
frequency16 [19:0] - The frequency of note16.

*/

module PolyFreqLookup(
	input clk,
	input reset,
	input [6:0] note1,
	input [6:0] note2,
	input [6:0] note3,
	input [6:0] note4,
	input [6:0] note5,
	input [6:0] note6,
	input [6:0] note7,
	input [6:0] note8,
	input [6:0] note9,
	input [6:0] note10,
	input [6:0] note11,
	input [6:0] note12,
	input [6:0] note13,
	input [6:0] note14,
	input [6:0] note15,
	input [6:0] note16,
	output reg [19:0] frequency1,
	output reg [19:0] frequency2,
	output reg [19:0] frequency3,
	output reg [19:0] frequency4,
	output reg [19:0] frequency5,
	output reg [19:0] frequency6,
	output reg [19:0] frequency7,
	output reg [19:0] frequency8,
	output reg [19:0] frequency9,
	output reg [19:0] frequency10,
	output reg [19:0] frequency11,
	output reg [19:0] frequency12,
	output reg [19:0] frequency13,
	output reg [19:0] frequency14,
	output reg [19:0] frequency15,
	output reg [19:0] frequency16
);
	
	reg [3:0] current_voice;
	wire [4:0] next_voice;
	reg [6:0] current_note;
	wire [19:0] current_frequency;
	
	FreqLookup lookup(
		current_note,
		current_frequency
	);
	
	FourBitFullAdder adder(
		current_voice,
		4'b0001,
		1'b0,
		next_voice[3:0],
		next_voice[4]
	);
	
	
	always @ (posedge clk or posedge reset) begin
	
		if (reset) begin
			current_voice = 4'b0000;
			frequency1 = 20'h00000;
			frequency2 = 20'h00000;
			frequency3 = 20'h00000;
			frequency4 = 20'h00000;
			frequency5 = 20'h00000;
			frequency6 = 20'h00000;
			frequency7 = 20'h00000;
			frequency8 = 20'h00000;
			frequency9 = 20'h00000;
			frequency10 = 20'h00000;
			frequency11 = 20'h00000;
			frequency12 = 20'h00000;
			frequency13 = 20'h00000;
			frequency14 = 20'h00000;
			frequency15 = 20'h00000;
			frequency16 = 20'h00000;
		end else begin
			
			current_voice <= next_voice[3:0];
			
			case(current_voice)
			
				4'h0: begin
					current_note <= note1;
					frequency16 <= current_frequency;
				end
				
				4'h1: begin
					current_note <= note2;
					frequency1 <= current_frequency;
				end
				
				4'h2: begin
					current_note <= note3;
					frequency2 <= current_frequency;
				end
				
				4'h3: begin
					current_note <= note4;
					frequency3 <= current_frequency;
				end
				
				4'h4: begin
					current_note <= note5;
					frequency4 <= current_frequency;
				end
				
				4'h5: begin
					current_note <= note6;
					frequency5 <= current_frequency;
				end
				
				4'h6: begin
					current_note <= note7;
					frequency6 <= current_frequency;
				end
				
				4'h7: begin
					current_note <= note8;
					frequency7 <= current_frequency;
				end
				
				4'h8: begin
					current_note <= note9;
					frequency8 <= current_frequency;
				end
				
				4'h9: begin
					current_note <= note10;
					frequency9 <= current_frequency;
				end 
				
				4'hA: begin
					current_note <= note11;
					frequency10 <= current_frequency;
				end
				
				4'hB: begin
					current_note <= note12;
					frequency11 <= current_frequency;
				end
				
				4'hC: begin
					current_note <= note13;
					frequency12 <= current_frequency;
				end
				
				4'hD: begin
					current_note <= note14;
					frequency13 <= current_frequency;
				end
					
				4'hE: begin
					current_note <= note15;
					frequency14 <= current_frequency;
				end
				
				4'hF: begin
					current_note <= note16;
					frequency15 <= current_frequency;
				end
				
			endcase
		
		end
		
	end
	
endmodule 
