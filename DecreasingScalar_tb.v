`timescale 1 ns / 100 ps

module DecreasingScalar_tb;
	reg clk;
	reg reset_n; // in external module reset will be triggered by note on and reset
	wire [4:0]scalar_out;
	
	DecreasingScalar dut(
		clk,
		reset_n,
		scalar_out
	);
	
	always begin
		clk = ~clk;
		#5;
	end
	
	initial begin
		clk = 1'b1;
		reset_n = 1'b1;
		#20;
		reset_n = 1'b0;
		#200;
		reset_n = 1'b1;
		#20;
		reset_n = 1'b0;
		#200;
	$stop;
	end
	
endmodule