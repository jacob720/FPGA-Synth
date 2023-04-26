`timescale 1 ns / 100 ps

module FourBitFullSubtractor_tb;

	//Data Type
	reg [3:0] a;
	reg [3:0] b;
	reg b_in;
	
	wire [3:0] diff;
	wire b_out;
	
	//Instantiate DUT
	
	FourBitFullSubtractor dut(
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
		
		for ( i = 0; i < 256; i = i + 1)
		begin
			
			{b,a} = i;
			
			#10;
			
		end
		
		$display("Testing Borrow In = 1");
		
		b_in = 1'b1;
		
		for ( i = 0; i < 256; i = i + 1)
		begin
			
			{b,a} = i;
			
			#10;
			
		end
		
		$stop;
	end

endmodule