`timescale 1 ns/100 ps

module TwentyBitMultiplier_tb;

	reg [19:0] a;
	reg [7:0] b;
	wire [27:0] product;
	
	TwentyBitMultiplier dut(
		a,
		b,
		product
	);
	
	integer i;
	integer expected_result;
	integer actual_result;
	integer correct;
	
	initial begin 
		
		correct = 0;
		
		for (i = 0; i < 1000000; i = i + 1) begin
			
			a = $urandom() % 1048576;
			b = $urandom() % 256;
			
			#1;
			
			expected_result = a * b;
			actual_result = product;
			
			if (!(expected_result == actual_result)) begin
				$display("Incorrect result at %d and %d, i = %d.",a,b,i);
			end else begin
				correct = correct + 1;
			end
		end
		
		$display("%d correct results out of 1000000.",correct);
		
		$stop;
		
	end
	
endmodule 
			