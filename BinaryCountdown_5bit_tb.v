`timescale 1 ns / 100 ps

module BinaryCountdown_5bit_tb;
	
	reg clk;
	reg reset;
	wire [4:0] count;
	
	BinaryCountdown_5bit dut (
		clk,
		reset,
		count
	);
	
always begin

	#2;
	clk <= ~clk;
	
end

integer i;
integer j;

initial begin

	clk = 1'b1;
	reset = 1'b1;
	
	#10;
	
	reset = 1'b0;
	for (i = 0; i < 50; i = i+1) begin
		if (i == 10|| i == 35) begin
			reset = 1'b1;
		end else begin
			reset = 1'b0;
		end
		#1;
	end
	
	
	$stop;
	
end
	


endmodule
