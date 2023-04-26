module DTypeFF(
	input clock,
	input D,
	output reg Q
);

always @ (posedge clock) begin
	Q <= D;
end

endmodule
