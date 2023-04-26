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
				note1 <= 32;
				note2 <= 44;
				note3 <= 48;
				note4 <= 51;
				note5 <= 56;
				note6 <= 60;
				note7 <= 63;
				note8 <= 67;
				note9 <= 32;
				note10 <= 44;
				note11 <= 48;
				note12 <= 51;
				note13 <= 56;
				note14 <= 60;
				note15 <= 63;
				note16 <= 67;
			end else if (beat < 16) begin   // F7
				note1 <= 37;
				note2 <= 49;
				note3 <= 53;
				note4 <= 56;
				note5 <= 61;
				note6 <= 65;
				note7 <= 68;
				note8 <= 72;
				note9 <= 37;
				note10 <= 49;
				note11 <= 53;
				note12 <= 56;
				note13 <= 61;
				note14 <= 65;
				note15 <= 68;
				note16 <= 72;
			end else if (beat < 24) begin  // Am7
				note1 <= 29;
				note2 <= 41;
				note3 <= 44;
				note4 <= 48;
				note5 <= 53;
				note6 <= 56;
				note7 <= 60;
				note8 <= 63;
				note9 <= 19;
				note10 <= 41;
				note11 <= 44;
				note12 <= 48;
				note13 <= 53;
				note14 <= 56;
				note15 <= 60;
				note16 <= 63;
			end else if (beat < 32) begin  // G6
				note1 <= 27;
				note2 <= 39;
				note3 <= 43;
				note4 <= 46;
				note5 <= 51;
				note6 <= 55;
				note7 <= 58;
				note8 <= 60;
				note9 <= 27;
				note10 <= 39;
				note11 <= 43;
				note12 <= 46;
				note13 <= 51;
				note14 <= 55;
				note15 <= 58;
				note16 <= 60;
			end
		end
	end
	
endmodule
