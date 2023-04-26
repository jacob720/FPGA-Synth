`timescale 1 ns / 100 ps

module EightBitFullSubtractor_tb;

	//Data Type
	reg [7:0] a;
	reg [7:0] b;
	
	wire [7:0] diff;
	wire b_out;
	
	//Instantiate DUT
	
	EightBitFullSubtractor dut(
	a,
	b,
	diff,
	b_out
	);

	integer i;
	integer j;
	
	initial begin
	
		for (i=0; i < 100; i=i+1) begin
			for (j=256; j > 0; j=j/2) begin
				a = 0;
				b = j-1;
				#5;
			end
			#5;
		end
	
	$stop;
	end
	
	
// normal tb
//	//Test Vectors
//	integer i;
//	integer i2;
//	
//	initial 
//	begin
//
//		for ( i = 0; i < 256; i = i + 1)
//		begin
//			
//			b = i;
//				for ( i2 = 0; i2 < 256; i2 = i2 + 1)
//				begin
//					
//					a = i2;
//					
//					#10;
//					
//				end
//			
//			#10;
//			
//		end
//
//		$stop;
//	end

endmodule