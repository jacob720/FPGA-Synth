`timescale 1 ns/100 ps

module OneBitFullAdder_tb;

	//inputs are registers
	reg a;
	reg b;
	reg c_in;
	
	//outputs are wires
	wire sum;
	wire c_out;
	
	//Instantiate Device Under Test
	OneBitFullAdder dut(
		a,
		b,
		c_in,
		sum,
		c_out
	);
	
	initial begin 
	
		c_in = 1'b0;
		a = 1'b0;
		b = 1'b0;
		#10;
		a = 1'b0;
		b = 1'b1;
		#10;
		a = 1'b1;
		b = 1'b0;
		#10
		a = 1'b1;
		b = 1'b1;
		#10;
		
		$stop;
	
	end

endmodule 