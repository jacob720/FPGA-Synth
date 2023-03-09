module Counter18bit(
	input clk,
	input reset,
	output reg [17:0] count
);

	wire useless;
	wire [17:0] w1;
	
	FullAdder18bit adder(
		count,
		18'd01,
		1'b0,
		w1,
		useless
	);
	
	always @(posedge clk or posedge reset) begin
	
		if (reset) begin 
			count <= 6'b111111;
		end else begin
			count <= w1;
		end
		
	end
endmodule 