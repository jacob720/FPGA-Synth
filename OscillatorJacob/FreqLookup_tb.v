`timescale 1 ns/100 ps

module FreqLookup_tb;

	reg [6:0] note;
	wire [19:0] frequency;

	FreqLookup dut(
		note,
		frequency
	);
	
	
	integer i;
	
	initial begin
	
		for (i = 0; i < 128; i = i + 1) begin
		
			note = i;
			#10;
			
		end
	
	$stop;
	end
	
endmodule
	