module SixBitCounter(
	input clk,
	input reset,
	output reg [5:0] count
);

	wire useless;
	wire [5:0] w1;
	
	SixBitFullAdder adder(
		count,
		6'b000001,
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