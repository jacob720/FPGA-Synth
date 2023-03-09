/* Chords.v

By: Jacob Williamson

Module Description:
A module that produces 16 note chords.

Inputs:
slow_clk - A slow clock that triggers chord changes.
reset - reset to start of chord progression.
ctrl [1:0] - Control bits to determine which chord progression is played.

Outputs:
note1[6:0] - note 1.
note2[6:0] - note 2.
note3[6:0] - note 3.
note4[6:0] - note 4.
note5[6:0] - note 5.
note6[6:0] - note 6.
note7[6:0] - note 7.
note8[6:0] - note 8.
note9[6:0] - note 9.
note10[6:0] - note 10.
note11[6:0] - note 11.
note12[6:0] - note 12.
note13[6:0] - note 13.
note14[6:0] - note 14.
note15[6:0] - note 15.
note16[6:0] - note 16.

*/

module Chords(
	input slow_clk,
	input reset,
	input [1:0] ctrl,
	output reg [6:0] note1,
	output reg [6:0] note2,
	output reg [6:0] note3,
	output reg [6:0] note4,
	output reg [6:0] note5,
	output reg [6:0] note6,
	output reg [6:0] note7,
	output reg [6:0] note8,
	output reg [6:0] note9,
	output reg [6:0] note10,
	output reg [6:0] note11,
	output reg [6:0] note12,
	output reg [6:0] note13,
	output reg [6:0] note14,
	output reg [6:0] note15,
	output reg [6:0] note16
);

	reg [4:0] beat;   // 32 beats, 8 bars
	wire [8:0] next_beat;
	
	EightBitFullAdder adder(
		{3'b000, beat},
		8'h01,
		1'b0,
		next_beat[7:0],
		next_beat[8]
	);
	
	always @ (posedge slow_clk or posedge reset) begin
	
		if (reset) begin
			beat <= 4'h0;
		end else begin
			beat <= next_beat[4:0];
			if (beat < 8) begin   // C7
				note1 <= 12;
				note2 <= 24;
				note3 <= 28;
				note4 <= 31;
				note5 <= 36;
				note6 <= 40;
				note7 <= 43;
				note8 <= 47;
				note9 <= 12;
				note10 <= 24;
				note11 <= 28;
				note12 <= 31;
				note13 <= 36;
				note14 <= 40;
				note15 <= 43;
				note16 <= 47;
			end else if (beat < 16) begin   // F7
				note1 <= 17;
				note2 <= 29;
				note3 <= 33;
				note4 <= 36;
				note5 <= 41;
				note6 <= 45;
				note7 <= 48;
				note8 <= 52;
				note9 <= 17;
				note10 <= 29;
				note11 <= 33;
				note12 <= 36;
				note13 <= 41;
				note14 <= 45;
				note15 <= 48;
				note16 <= 52;
			end else if (beat < 24) begin  // Am7
				note1 <= 9;
				note2 <= 21;
				note3 <= 24;
				note4 <= 28;
				note5 <= 33;
				note6 <= 36;
				note7 <= 40;
				note8 <= 43;
				note9 <= 9;
				note10 <= 21;
				note11 <= 24;
				note12 <= 28;
				note13 <= 33;
				note14 <= 36;
				note15 <= 40;
				note16 <= 43;
			end else if (beat < 32) begin  // G6
				note1 <= 7;
				note2 <= 19;
				note3 <= 23;
				note4 <= 26;
				note5 <= 31;
				note6 <= 35;
				note7 <= 38;
				note8 <= 40;
				note9 <= 7;
				note10 <= 19;
				note11 <= 23;
				note12 <= 26;
				note13 <= 31;
				note14 <= 35;
				note15 <= 38;
				note16 <= 40;
			end
		end
	end
	
endmodule
