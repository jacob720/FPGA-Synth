`timescale 1 ns / 100 ps

module MUX_8input_8bit_tb;
	reg [7:0]a;
	reg [7:0]b;
	reg [7:0]c;
	reg [7:0]d;
	reg [7:0]e;
	reg [7:0]f;
	reg [7:0]g;
	reg [7:0]h;
	reg [2:0]sel;
	
	wire [7:0]out;
	
	MUX_8input_8bit dut(
	a,
	b,
	c,
	d,
	e,
	f,
	g,
	h,
	sel,
	out
	);
	
	integer i;
	integer expected_result;
	integer actual_result;
	
	initial begin
		
		sel = 3'b000;
		
		for (i = 0; i < 20; i = i+1) begin
			a = $random()%255;
			b = $random()%255;
			c = $random()%255;
			d = $random()%255;
			e = $random()%255;
			f = $random()%255;
			g = $random()%255;
			h = $random()%255;
			
			
			#5;
			
			actual_result = out;
			expected_result = a;
			
			if (expected_result!=actual_result) begin
				$display("Error at sel = %d, i = %d | expected = %d actual = %d",sel,i,expected_result,actual_result);
			end
			
		end
		
		sel = 3'b001;
		
		for (i = 0; i < 20; i = i+1) begin
			a = $random()%255;
			b = $random()%255;
			c = $random()%255;
			d = $random()%255;
			e = $random()%255;
			f = $random()%255;
			g = $random()%255;
			h = $random()%255;
			
			#5;
			
			actual_result = out;
			expected_result = b;
			
			if (expected_result!=actual_result) begin
				$display("Error at sel = %d, i = %d | expected = %d actual = %d",sel,i,expected_result,actual_result);
			end
			
		end
		
		sel = 3'b010;
		
		for (i = 0; i < 20; i = i+1) begin
			a = $random()%255;
			b = $random()%255;
			c = $random()%255;
			d = $random()%255;
			e = $random()%255;
			f = $random()%255;
			g = $random()%255;
			h = $random()%255;
			
			#5;
			
			actual_result = out;
			expected_result = c;
			
			if (expected_result!=actual_result) begin
				$display("Error at sel = %d, i = %d | expected = %d actual = %d",sel,i,expected_result,actual_result);
			end
			
		end
		
		sel = 3'b011;
		
		for (i = 0; i < 20; i = i+1) begin
			a = $random()%255;
			b = $random()%255;
			c = $random()%255;
			d = $random()%255;
			e = $random()%255;
			f = $random()%255;
			g = $random()%255;
			h = $random()%255;
			
			#5;
			
			actual_result = out;
			expected_result = d;
			
			if (expected_result!=actual_result) begin
				$display("Error at sel = %d, i = %d | expected = %d actual = %d",sel,i,expected_result,actual_result);
			end
			
		end
		
		sel = 3'b100;
		
		for (i = 0; i < 20; i = i+1) begin
			a = $random()%255;
			b = $random()%255;
			c = $random()%255;
			d = $random()%255;
			e = $random()%255;
			f = $random()%255;
			g = $random()%255;
			h = $random()%255;
			
			#5;
			
			actual_result = out;
			expected_result = e;
			
			if (expected_result!=actual_result) begin
				$display("Error at sel = %d, i = %d | expected = %d actual = %d",sel,i,expected_result,actual_result);
			end
			
		end
		
		sel = 3'b101;
		
		for (i = 0; i < 20; i = i+1) begin
			a = $random()%255;
			b = $random()%255;
			c = $random()%255;
			d = $random()%255;
			e = $random()%255;
			f = $random()%255;
			g = $random()%255;
			h = $random()%255;
			
			#5;
			
			actual_result = out;
			expected_result = f;
			
			if (expected_result!=actual_result) begin
				$display("Error at sel = %d, i = %d | expected = %d actual = %d",sel,i,expected_result,actual_result);
			end
			
		end
		
		sel = 3'b110;
		
		for (i = 0; i < 20; i = i+1) begin
			a = $random()%255;
			b = $random()%255;
			c = $random()%255;
			d = $random()%255;
			e = $random()%255;
			f = $random()%255;
			g = $random()%255;
			h = $random()%255;
			
			#5;
			
			actual_result = out;
			expected_result = g;
			
			if (expected_result!=actual_result) begin
				$display("Error at sel = %d, i = %d | expected = %d actual = %d",sel,i,expected_result,actual_result);
			end
			
		end
		
		sel = 3'b111;
		
		for (i = 0; i < 20; i = i+1) begin
			a = $random()%255;
			b = $random()%255;
			c = $random()%255;
			d = $random()%255;
			e = $random()%255;
			f = $random()%255;
			g = $random()%255;
			h = $random()%255;
			
			#5;
			
			actual_result = out;
			expected_result = h;
			
			if (expected_result!=actual_result) begin
				$display("Error at sel = %d, i = %d | expected = %d actual = %d",sel,i,expected_result,actual_result);
			end
			
			
		end
		
		$stop;
		
	end
	
endmodule