`timescale 1 ns/100 ps

module FourBitFullAdder_tb;

	//inputs are registers
	reg [3:0] a;
	reg [3:0] b;
	reg c_in;
	
	//outputs are wires
	wire [3:0]sum;
	wire c_out;
	
	//Instantiate Device Under Test
	FourBitFullAdder dut(
		a,
		b,
		c_in,
		sum,
		c_out
	);
	
	integer i;
	integer actual_value;
	integer expected_value;
	integer errors;
	
	initial begin 
	
		errors = 0;
	
		for (i = 0; i < 512; i = i + 1) begin
			
			{a, b, c_in} = i;
			
			#10;
			
			actual_value = {c_out, sum};
			expected_value = a + b + c_in;
			
			if (~(expected_value == actual_value)) begin
				$display("Incorrect value at a = %d, b = %d, c_in = %d, i = %d", a, b, c_in, i);
				errors = errors + 1;
			end
		
		end
		
		if (errors == 0) begin
			$display("All tests passed.");
		end
		
	$stop;
	
	end

endmodule 