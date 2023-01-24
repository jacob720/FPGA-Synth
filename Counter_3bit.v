module Counter_3bit(
	input clk,
	input reset,
	output reg [2:0]count,
	output reg end_count
);

	always @ (posedge clk) begin
		count <= count + 1;
		if (count==3'b111) begin
			end_count <= 1'b1;
			count <= 3'b000;
		end
		if (count!=3'b111) begin
			end_count <= 1'b0;
		end
		if (reset) begin
			end_count <= 1'b0;
			count <= 3'b000;
		end
	end

endmodule