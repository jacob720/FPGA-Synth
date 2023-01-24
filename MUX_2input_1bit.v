module MUX_2input_1bit(
	input a,
	input b,
	input sel,
	output reg out
);

	always @ (a or b or sel) begin // https://www.javatpoint.com/verilog-multiplexer
		
		case(sel)
		
			1'b0: out <= a;
			1'b1: out <= b;
		
		endcase
		
	end
endmodule