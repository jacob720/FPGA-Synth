`timescale 1 ns / 100 ps

module HalfSubtractor_tb;
	reg A;
	reg B;
	wire diff;
	wire borrow;
	
	HalfSubtractor dut(
		A,
		B,
		diff,
		borrow
	);
	
	initial 
	begin
		A = 1'b0;
		B = 1'b0;
		#10;
		A = 1'b0;
		B = 1'b1;
		#10;
		A = 1'b1;
		B = 1'b0;
		#10;
		A = 1'b1;
		B = 1'b1;
		#10;
		
		$stop;
	end	
endmodule