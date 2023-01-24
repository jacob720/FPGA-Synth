module MUX_3input_8bit(
	input [7:0]a,
	input [7:0]b,
	input [7:0]c,
	input [1:0]sel,
	
	output reg [7:0]out
);

	always @ (a or b or c or sel) begin // https://www.javatpoint.com/verilog-multiplexer
		
		case(sel)
		
			2'b00: out <= a;
			2'b01: out <= b;
			2'b10: out <= c;
			2'b11: out <= a; 
		
		endcase
		
	end
endmodule