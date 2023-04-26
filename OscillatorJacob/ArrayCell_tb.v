`timescale 1 ns/100 ps

module ArrayCell_tb;

	reg a;
	reg b;
	reg sum_in;
	reg c_in;
	wire sum;
	wire c_out;
	
	ArrayCell dut (
		a,
		b,
		sum_in,
		c_in,
		sum,
		c_out
	);
	
	integer i;
	
	initial begin
		
		for (i = 0; i < 16; i = i + 1) begin
		
			{a,b,sum_in,c_in} = i;
			#10;
			
		end
	
	$stop;
	
	end
	
endmodule 
	