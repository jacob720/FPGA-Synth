module JacobTopLevel(
	input clock48kHz,
	input reset,
	output [19:0] signal
);
	wire [1:0] ctrl;
	
	wire [6:0] note1;
	wire [6:0] note2;
	wire [6:0] note3;
	wire [6:0] note4;
	wire [6:0] note5;
	wire [6:0] note6;
	wire [6:0] note7;
	wire [6:0] note8;
	wire [6:0] note9;
	wire [6:0] note10;
	wire [6:0] note11;
	wire [6:0] note12;
	wire [6:0] note13;
	wire [6:0] note14;
	wire [6:0] note15;
	wire [6:0] note16;
	
	wire [19:0] freq1;
	wire [19:0] freq2;
	wire [19:0] freq3;
	wire [19:0] freq4;
	wire [19:0] freq5;
	wire [19:0] freq6;
	wire [19:0] freq7;
	wire [19:0] freq8;
	wire [19:0] freq9;
	wire [19:0] freq10;
	wire [19:0] freq11;
	wire [19:0] freq12;
	wire [19:0] freq13;
	wire [19:0] freq14;
	wire [19:0] freq15;
	wire [19:0] freq16;
	
	wire [15:0] wave1;
	wire [15:0] wave2;
	wire [15:0] wave3;
	wire [15:0] wave4;
	wire [15:0] wave5;
	wire [15:0] wave6;
	wire [15:0] wave7;
	wire [15:0] wave8;
	wire [15:0] wave9;
	wire [15:0] wave10;
	wire [15:0] wave11;
	wire [15:0] wave12;
	wire [15:0] wave13;
	wire [15:0] wave14;
	wire [15:0] wave15;
	wire [15:0] wave16;
	
	reg clock2Hz;
	wire [17:0] count;
	reg reset_counter;

	Counter18bit counter(
		clock48kHz,
		reset_counter,
		count
	);
	
	always @ (posedge clock48kHz or posedge reset) begin
		if (reset) begin
			reset_counter = 1;
			clock2Hz = 0;
		end else if (count == 12000) begin
			clock2Hz = ~clock2Hz;
			reset_counter = 1;
		end else begin
			reset_counter = 0;
		end
	end
	
	assign ctrl = 2'b00;
	
	Chords chords(
		clock2Hz,
		reset,
		2'b00,
		note1,
		note2,
		note3,
		note4,
		note5,
		note6,
		note7,
		note8,
		note9,
		note10,
		note11,
		note12,
		note13,
		note14,
		note15,
		note16
	);
	
	PolyFreqLookup frequencies(
		clock48kHz,
		reset,
		note1,
		note2,
		note3,
		note4,
		note5,
		note6,
		note7,
		note8,
		note9,
		note10,
		note11,
		note12,
		note13,
		note14,
		note15,
		note16,
		freq1,
		freq2,
		freq3,
		freq4,
		freq5,
		freq6,
		freq7,
		freq8,
		freq9,
		freq10,
		freq11,
		freq12,
		freq13,
		freq14,
		freq15,
		freq16
	);
		
	Oscillator oscillator1(
		clock48kHz,
		reset,
		freq1,
		ctrl,
		wave1
	);
	
	Oscillator oscillator2(
		clock48kHz,
		reset,
		freq2,
		ctrl,
		wave2
	);
	
	Oscillator oscillator3(
		clock48kHz,
		reset,
		freq3,
		ctrl,
		wave3
	);
	
	Oscillator oscillator4(
		clock48kHz,
		reset,
		freq4,
		ctrl,
		wave4
	);
	
	Oscillator oscillator5(
		clock48kHz,
		reset,
		freq5,
		ctrl,
		wave5
	);
	
	Oscillator oscillator6(
		clock48kHz,
		reset,
		freq6,
		ctrl,
		wave6
	);
	
	Oscillator oscillator7(
		clock48kHz,
		reset,
		freq7,
		ctrl,
		wave7
	);
	
	Oscillator oscillator8(
		clock48kHz,
		reset,
		freq8,
		ctrl,
		wave8
	);
	
	Oscillator oscillator9(
		clock48kHz,
		reset,
		freq9,
		ctrl,
		wave9
	);
	
	Oscillator oscillator10(
		clock48kHz,
		reset,
		freq10,
		ctrl,
		wave10
	);
	
	Oscillator oscillator11(
		clock48kHz,
		reset,
		freq11,
		ctrl,
		wave11
	);
	
	Oscillator oscillator12(
		clock48kHz,
		reset,
		freq12,
		ctrl,
		wave12
	);
	
	Oscillator oscillator13(
		clock48kHz,
		reset,
		freq13,
		ctrl,
		wave13
	);
	
	Oscillator oscillator14(
		clock48kHz,
		reset,
		freq14,
		ctrl,
		wave14
	);
	
	Oscillator oscillator15(
		clock48kHz,
		reset,
		freq15,
		ctrl,
		wave15
	);
	
	Oscillator oscillator16(
		clock48kHz,
		reset,
		freq16,
		ctrl,
		wave16
	);
	
	Mixer16 mixer(
		clock48kHz,
		wave1,
		wave2,
		wave3,
		wave4,
		wave5,
		wave6,
		wave7,
		wave8,
		wave9,
		wave10,
		wave11,
		wave12,
		wave13,
		wave14,
		wave15,
		wave16,
		signal
	);

endmodule 
