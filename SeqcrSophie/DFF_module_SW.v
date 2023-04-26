//slight adaptation from janes - two outputs
//19/1/23


module DFF_module_SW(
	input D,
	input clk,
	
	output reg Q,
	output reg Q2 // for the one bit register to have a feedback loop and an output
);

	always @ (posedge clk)
	
	begin
		
		Q <= D;
		Q2 = Q; //assigns the same for the feedback loop
		
	end
	
endmodule