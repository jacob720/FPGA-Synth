`timescale 1 ns / 100 ps

module Counter_5bit_tb;
	reg clk;
	reg reset;
	wire [4:0]count;
	wire end_count;
	
	Counter_5bit dut(
		clk,
		reset,
		count,
		end_count
	);
	
	always begin
		
		#5;
		clk <= ~clk;
		
	end
	
	initial begin
		
		clk <= 1'b0;
		reset <= 1'b0;
		#20
		reset <= 1'b1;
		#10
		reset <= 1'b0;
		#200
		$stop;
		
	end
	
endmodule