`timescale 1 ns / 100 ps

module ThreeBitFullSubtractor_tb;

	//Data Type
	reg [2:0] a;
	reg [2:0] b;
	reg b_in;
	
	wire [2:0] diff;
	wire b_out;
	
	//Instantiate DUT
	
	ThreeBitFullSubtractor dut(
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
		
		for ( i = 0; i < 64; i = i + 1)
		begin
			
			{b,a} = i;
			
			#10;
			
		end
		
		$display("Testing Borrow In = 1");
		
		b_in = 1'b1;
		
		for ( i = 0; i < 64; i = i + 1)
		begin
			
			{b,a} = i;
			
			#10;
			
		end
		
		$stop;
	end

endmodule