module MUX_8input_8bit(
	input [7:0]a,
	input [7:0]b,
	input [7:0]c,
	input [7:0]d,
	input [7:0]e,
	input [7:0]f,
	input [7:0]g,
	input [7:0]h,
	input [2:0]sel,
	
	output reg [7:0]out
	
);

	always @ (a or b or c or d or e or f or g or h or sel) begin // https://www.javatpoint.com/verilog-multiplexer
		
		case(sel)
		
			3'b000: out <= a;
			3'b001: out <= b;
			3'b010: out <= c;
			3'b011: out <= d;
			3'b100: out <= e;
			3'b101: out <= f;
			3'b110: out <= g;
			3'b111: out <= h;
		
		endcase
		
	end

endmodule