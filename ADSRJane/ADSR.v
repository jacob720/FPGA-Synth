//decay not triggering
//sustain level to release from previous stage

module ADSR(
	input clk,//will have additional clock divider inputs selected between based on user input
	input clk_attack,
	input clk_decay,
	input clk_release,
	input note_on,
	input reset,
	input [15:0]in,
	input [4:0]sustain_level, // 0-4
	output [19:0]signal_out
	//output [3:0]count_out // can remove from project after
);

wire [19:0] pad_in;
wire [19:0] a_out;
wire [19:0] d_out;
wire [19:0] s_out;
wire [19:0] r_out;
wire [19:0] mux1_out;
wire [19:0] mux2_out;
wire [19:0] mux3_out;
wire start_decay;
wire start_sustain;
wire not_note_on;
wire [3:0] sel_ads;
wire not_s_ads0;
wire not_s_ads1;
wire inc1;
wire inc2;
wire end_release;
reg wait_for_attack;
wire [4:0]a_level;
wire [4:0]d_level;

not(not_note_on,note_on);


Attack a(
	clk,
	clk_attack,
	pad_in, // a in
	note_on,
	a_out,
	start_decay,
	a_level
);

Decay d(
	clk,
	clk_decay,
	pad_in,
	sustain_level,
	start_decay,
	d_out,
	d_level,
	start_sustain
);

Sustain s(
	clk,
	sustain_level,
	pad_in,
	s_out
);


Release r( // rather than sustain level will need to take in previous scaling amount
	clk,
	clk_release,
	note_on,
	sustain_level,
	pad_in,
	r_out,
	end_release
);

not(not_s_ads0,sel_ads[0]);
not(not_s_ads1,sel_ads[1]);
and(inc1,clk,not_s_ads0,not_s_ads1,start_decay,note_on);
and(inc2,clk,sel_ads[0],not_s_ads1,start_sustain,note_on);
or(counter_clk,inc1,inc2,not_note_on);

BinaryCounter_4bit ads_mux_sel(
	counter_clk,
	not_note_on,
	4'b0000,
	sel_ads
);

assign count_out = sel_ads;

Multiplexer20bit AorD( // mux 20 bit
	a_out,
	d_out,
	sel_ads[0],
	mux1_out
);

Multiplexer20bit DorS(
	mux1_out,
	s_out,
	sel_ads[1],
	mux2_out
);

Multiplexer20bit ADSorR(
	mux2_out,
	r_out,
	not_note_on, 
	mux3_out
);

Multiplexer20bit zero_mux(
	20'b0,
	mux3_out,
	wait_for_attack,
	signal_out
);

always @ (posedge clk) begin
	if(note_on) begin
		wait_for_attack <= 1'b1;
	end
	else if (!note_on) begin
		if(reset)begin
			wait_for_attack <= 1'b0;
		end 
		if(end_release)begin
			wait_for_attack <= 1'b0;
		end
	end
	else begin
		wait_for_attack <= 1'b1;
	end

end

assign pad_in = {in,1'b0,1'b0,1'b0,1'b0};

endmodule