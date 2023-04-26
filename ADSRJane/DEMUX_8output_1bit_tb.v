`timescale 1 ns / 100 ps

module DEMUX_8output_1bit_tb;
	reg in;
	reg [2:0]sel;
	
	wire a;
	wire b;
	wire c;
	wire d;
	wire e;
	wire f;
	wire g;
	wire h;
	
	DEMUX_8output_1bit dut(
	in,
	sel,
	a,
	b,
	c,
	d,
	e,
	f,
	g,
	h
	);
	
	integer i;
	integer j;
	integer expected_result;
	integer actual_result;
	
	initial begin
		
	for (j = 0; j < 4; j = j+1) begin
			for (i = 0; i < 8; i = i+1) begin
				sel = i;
				in = $random()%2;
				
				#5;
				
			end
	end
		
		$stop;
		
	end
	
endmodule