`timescale 10 ns/ 1 ns

module TESTSW2_tb;

	reg	  areset;
	reg	  inclk0;
	wire	  c0;
	wire	  c1;
	wire	  c2;
	wire	  locked;
	
	TESTSW2 dut(
	areset,
	inclk0,
	c0,
	c1,
	c2,
	locked);
	
	
	always begin
	
	#1
	
	inclk0 <= ~inclk0;
	
	end

initial begin
		
		inclk0 <= 1'b0;
		#100
		areset <= 0;
		#5;
		areset<=1;
		#5;
		areset<=0;
		
		#50000;
		
		$stop;
	
	end
	

	
endmodule 