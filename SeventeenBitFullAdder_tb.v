`timescale 1 ns/100 ps

module SeventeenBitFullAdder_tb;

	//inputs are registers
	reg [16:0] a;
	reg [16:0] b;
	reg c_in;
	
	//outputs are wires
	wire [16:0] sum;
	wire c_out;
	
	//Instantiate Device Under Test
	SeventeenBitFullAdder dut(
		a[16:0],
		b[16:0],
		c_in,
		sum[16:0],
		c_out
	);
	
	integer i;
	integer expected_result;
	integer actual_result;
	
	initial begin 
	
		c_in = 1'b0;
		
		for (i = 0; i < 1000000; i = i + 1) begin
		
			a = $urandom() % 131072;
			b = $urandom() % 131072;
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