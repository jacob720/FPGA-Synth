`timescale 1 ns / 100 ps

module DFF_module_tb;
	
	reg D;
	reg clk;
	
	wire Q;
	
	DFF_module dut(
	D,
	clk,
	Q
	);
	
	always begin
		
		#10;
		clk <= ~clk;
		
	end
	
	initial begin
		
		clk <= 1'b0;
		D <= 1'b0;
		#20
		D <= 1'b1;
		#20
		D <= 1'b0;
		#20
		$stop;
		
	end
	
endmodule
	
	