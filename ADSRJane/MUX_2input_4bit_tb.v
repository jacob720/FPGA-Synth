`timescale 1 ns / 100 ps

module MUX_2input_4bit_tb;
	reg [3:0]a;
	reg [3:0]b;
	reg sel;
	wire [3:0] out;
	
	MUX_2input_4bit dut(
		a,
		b,
		sel,
		out
	);
	
	integer i;
	initial begin
		sel=0;
		#5;
		for(i=0;i<10;i=i+1) begin
			a=$urandom()%16;
			b=$urandom()%16;
			#5;
		end
		sel=1;
		#5;
		for(i=0;i<10;i=i+1) begin
			a=$urandom()%16;
			b=$urandom()%16;
			#5;
		end
	$stop;
	end
	
	
endmodule