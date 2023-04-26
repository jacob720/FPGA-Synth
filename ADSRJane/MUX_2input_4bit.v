module MUX_2input_4bit(
	input [3:0]a,
	input [3:0]b,
	input sel,
	output reg [3:0] out
);

always @ (a or b or sel) begin
	
	case(sel)
		
			1'b0: out <= a;
			1'b1: out <= b;
			default: out <= a;
		
		endcase
		
end

endmodule
		