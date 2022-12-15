`timescale 1 ns / 100 ps

module MUX_4input_8bit_tb;
	reg [7:0]a;
	reg [7:0]b;
	reg [7:0]c;
	reg [7:0]d;
	reg [1:0]sel;
	
	wire [7:0]out;
	
	MUX_4input_8bit dut(
	a,
	b,
	c,
	d,
	sel,
	out
	);
	
	integer i;
	integer expected_result;
	integer actual_result;
	
	initial begin
		
		sel = 2'b00;
		
		for (i = 0; i < 20; i = i+1) begin
			a = $random()%255;
			b = $random()%255;
			c = $random()%255;
			d = $random()%255;
			
			expected_result = a;
			actual_result = out;
			
			#5;
			
		end
		
		sel = 2'b01;
		
		for (i = 0; i < 20; i = i+1) begin
			a = $random()%255;
			b = $random()%255;
			c = $random()%255;
			d = $random()%255;
			
			expected_result = b;
			actual_result = out;
			
			#5;
			
		end
		
		sel = 2'b10;
		
		for (i = 0; i < 20; i = i+1) begin
			a = $random()%255;
			b = $random()%255;
			c = $random()%255;
			d = $random()%255;
			
			expected_result = c;
			actual_result = out;
			
			#5;
			
		end
		
		sel = 2'b11;
		
		for (i = 0; i < 20; i = i+1) begin
			a = $random()%255;
			b = $random()%255;
			c = $random()%255;
			d = $random()%255;
			
			expected_result = d;
			actual_result = out;
			
			#5;
			
		end
		
		
		$stop;
	end

endmodule