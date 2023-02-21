module Decay(
	input clk,
	input clk_d,
	input [19:0] in,
	input [4:0] decay_amount,
	input start,
	output reg [19:0] out,
	output [4:0] shift_amount,
	output start_sustain
);

wire [4:0]scalar;
wire [4:0]scale_compare;
wire end_decay;
wire not_clk;
reg reset;

IncreasingScalar scalar_inc(
	clk_d,
	start,
	5'b00000,
	scalar
);

	xnor(scale_compare[0],scalar[0],decay_amount[0]);
	xnor(scale_compare[1],scalar[1],decay_amount[1]);
	xnor(scale_compare[2],scalar[2],decay_amount[2]);
	xnor(scale_compare[3],scalar[3],decay_amount[3]);
	xnor(scale_compare[4],scalar[4],decay_amount[4]);
	and(end_decay,scale_compare[0],scale_compare[1],scale_compare[2],scale_compare[3],scale_compare[4]);
	
	assign shift_amount = scalar;
	
	not(not_clk,clk);
	
	DTypeFF dff(
		not_clk,
		end_decay,
		start_sustain
	);
	
	always @ (posedge clk) begin
	
		out <= in >> scalar;
		
	end
	
endmodule