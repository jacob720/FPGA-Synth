module JaneTopLevel(
	input CLOCK12M,
	input CLOCK48kHz,
	input clk_attack,
	input clk_decay,
	input clk_release,
	input RESET,
	input [15:0]NoteOn,
	
	input [15:0] wave0,
	input [15:0] wave1,
	input [15:0] wave2,
	input [15:0] wave3,
	input [15:0] wave4,
	input [15:0] wave5,
	input [15:0] wave6,
	input [15:0] wave7,
	input [15:0] wave8,
	input [15:0] wave9,
	input [15:0] wave10,
	input [15:0] wave11,
	input [15:0] wave12,
	input [15:0] wave13,
	input [15:0] wave14,
	input [15:0] wave15,
	
	output [15:0] wave0ADSR,
	output [15:0] wave1ADSR,
	output [15:0] wave2ADSR,
	output [15:0] wave3ADSR,
	output [15:0] wave4ADSR,
	output [15:0] wave5ADSR,
	output [15:0] wave6ADSR,
	output [15:0] wave7ADSR,
	output [15:0] wave8ADSR,
	output [15:0] wave9ADSR,
	output [15:0] wave10ADSR,
	output [15:0] wave11ADSR,
	output [15:0] wave12ADSR,
	output [15:0] wave13ADSR,
	output [15:0] wave14ADSR,
	output [15:0] wave15ADSR
);


ADSR adsr0(
	CLOCK48kHz,
	clk_attack,
	clk_decay,
	clk_release,
	NoteOn[0],
	
	RESET,
	wave0,
	5'b00010,
	wave0ADSR
);


ADSR adsr1(
	CLOCK48kHz,
	clk_attack,
	clk_decay,
	clk_release,
	NoteOn[1],
	
	RESET,
	wave1,
	5'b00010,
	wave1ADSR
);

ADSR adsr2(
	CLOCK48kHz,
	clk_attack,
	clk_decay,
	clk_release,
	NoteOn[2],
	
	RESET,
	wave2,
	5'b00010,
	wave2ADSR
);


ADSR adsr3(
	CLOCK48kHz,
	clk_attack,
	clk_decay,
	clk_release,
	NoteOn[3],
	
	RESET,
	wave3,
	5'b00010,
	wave3ADSR
);


ADSR adsr4(
	CLOCK48kHz,
	clk_attack,
	clk_decay,
	clk_release,
	NoteOn[4],
	
	RESET,
	wave4,
	5'b00010,
	wave4ADSR
);


ADSR adsr5(
	CLOCK48kHz,
	clk_attack,
	clk_decay,
	clk_release,
	NoteOn[5],
	
	RESET,
	wave5,
	5'b00010,
	wave5ADSR
);


ADSR adsr6(
	CLOCK48kHz,
	clk_attack,
	clk_decay,
	clk_release,
	NoteOn[6],
	
	RESET,
	wave6,
	5'b00010,
	wave6ADSR
);

ADSR adsr7(
	CLOCK48kHz,
	clk_attack,
	clk_decay,
	clk_release,
	NoteOn[7],
	
	RESET,
	wave7,
	5'b00010,
	wave7ADSR
);


ADSR adsr8(
	CLOCK48kHz,
	clk_attack,
	clk_decay,
	clk_release,
	NoteOn[8],
	
	RESET,
	wave8,
	5'b00010,
	wave8ADSR
);


ADSR adsr9(
	CLOCK48kHz,
	clk_attack,
	clk_decay,
	clk_release,
	NoteOn[9],
	
	RESET,
	wave9,
	5'b00010,
	wave9ADSR
);


ADSR adsr10(
	CLOCK48kHz,
	clk_attack,
	clk_decay,
	clk_release,
	NoteOn[10],
	
	RESET,
	wave10,
	5'b00010,
	wave10ADSR
);


ADSR adsr11(
	CLOCK48kHz,
	clk_attack,
	clk_decay,
	clk_release,
	NoteOn[11],
	
	RESET,
	wave11,
	5'b00010,
	wave11ADSR
);


ADSR adsr12(
	CLOCK48kHz,
	clk_attack,
	clk_decay,
	clk_release,
	NoteOn[12],
	
	RESET,
	wave12,
	5'b00010,
	wave12ADSR
);


ADSR adsr13(
	CLOCK48kHz,
	clk_attack,
	clk_decay,
	clk_release,
	NoteOn[13],
	
	RESET,
	wave13,
	5'b00010,
	wave13ADSR
);


ADSR adsr14(
	CLOCK48kHz,
	clk_attack,
	clk_decay,
	clk_release,
	NoteOn[14],
	
	RESET,
	wave14,
	5'b00010,
	wave14ADSR
);

ADSR adsr15(
	CLOCK48kHz,
	clk_attack,
	clk_decay,
	clk_release,
	NoteOn[15],
	
	RESET,
	wave15,
	5'b00010,
	wave15ADSR
);




endmodule
