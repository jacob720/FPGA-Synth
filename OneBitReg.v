//onebitreg
//created by sophie watson
//using the nand2tetris HDl code as referance

module OneBitReg (

	input IN,
	input LOAD,
	input clk,
	output wire OUT

);

	wire DFFOUT;
	wire MUXOUT;
	//mux(a,b,sel,out) where a = when load is 1
	Mux21 Mux1(DFFOUT, IN, LOAD,MUXOUT); //DFF is a, as inputs when load = 0
	
	//DFF(in,out,out)
	DFF_module_SW DFF1(MUXOUT, clk, OUT, DFFOUT); //out is output, DFFOUT is feedback loop - they have the same value

	
endmodule
