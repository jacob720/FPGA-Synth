module Counter_5bit(
	input clk,
	input reset,
	output reg [4:0]count,
	output reg end_count
);

	always @ (posedge clk) begin
		count <= count + 1;
		if (count==5'b11111) begin
			end_count <= 1'b1;
			count <= 5'b00000;
		end
		if (count!=5'b11111) begin
			end_count <= 1'b0;
		end
		if (reset) begin
			end_count <= 1'b0;
			count <= 5'b00000;
		end
	end

endmodule