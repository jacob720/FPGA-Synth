`timescale 1 ns/100 ps

module SixteenBitFullAdder_tb;

	//inputs are registers
	reg [15:0] a;
	reg [15:0] b;
	reg c_in;
	
	//outputs are wires
	wire [15:0] sum;
	wire c_out;
	
	//Instantiate Device Under Test
	SixteenBitFullAdder dut(
		a[15:0],
		b[15:0],
		c_in,
		sum[15:0],
		c_out
	);
	
	integer i;
	integer expected_result;
	integer actual_result;
	
	initial begin 
	
		c_in = 1'b0;
		
		for (i = 0; i < 1000000; i = i + 1) begin
		
			a = $urandom() % 65536;
			b = $urandom() % 65536;
			c_in = $random % 2;
			#10;
			
			expected_result = a + b + c_in;
			actual_result = {c_out,sum};
			
			if (!(expected_result == actual_result)) begin
				$display("Incorrect result at %d and %d, i = %d.",a,b,i);
			end 
			
		end 
		
		$stop;
	
	end

endmodule 