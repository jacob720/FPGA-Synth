// will add additional scaling before left shift signal before input to attack
module Attack(
	input clk, 
	input clk_a,
	input [19:0]in,
	input note_on,
	output reg [19:0]out, 
	output start_decay,
	output [4:0] shift_amount
);

wire [4:0]scalar;
wire [4:0]not_scalar;
wire end_attack;
reg reset;

wire not_noteon;
not(not_noteon,note_on);

DecreasingScalar scalar_dec(
	clk_a,
	not_noteon,
	scalar
);

assign shift_amount = scalar;

	not(not_scalar[0],scalar[0]);
	not(not_scalar[1],scalar[1]);
	not(not_scalar[2],scalar[2]);
	not(not_scalar[3],scalar[3]);
	not(not_scalar[4],scalar[4]);
	not(clk_n,clk);
	and(end_attack,not_scalar[0],not_scalar[1],not_scalar[2],not_scalar[3],not_scalar[4]);
	
	DTypeFF dff(
		clk_n,
		end_attack,
		start_decay
	);
	
	always @ (posedge clk) begin
	
		out <= in >> scalar;
		
	end
	


endmodule