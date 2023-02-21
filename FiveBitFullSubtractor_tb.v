`timescale 1 ns / 100 ps

module FiveBitFullSubtractor_tb;

	//Data Type
	reg [4:0] a;
	reg [4:0] b;
	reg b_in;
	
	wire [4:0] diff;
	wire b_out;
	
	//Instantiate DUT
	
	FiveBitFullSubtractor dut(
	a,
	b,
	b_in,
	diff,
	b_out
	);
	
	//Test Vectors
	integer i;
	
	initial 
	begin
		
		$display("Testing Borrow In = 0");
		
		b_in = 1'b0;
		
		for ( i = 0; i < 100; i = i + 1)
		begin
			
			a = $urandom()%32;
			b = $urandom()%32;
			
			#10;
			
		end
		
		$display("Testing Borrow In = 1");
		
		b_in = 1'b1;
		
		for ( i = 0; i < 256; i = i + 1)
		begin
			
			a = $urandom()%32;
			b = $urandom()%32;
			
			#10;
			
		end
		
		$stop;
	end

endmodule