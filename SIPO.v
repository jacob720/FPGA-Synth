module SIPO(
	
	input [3:0]in,
	input clk,
	
	output out_0,
	output out_1,
	output out_2,
	output out_3
);

	
	DFF_module dff0(
		in[0],
		clk,
		out_0
	);
	
	DFF_module dff1(
		in[1],
		clk,
		out_1
	);
	
	DFF_module dff2(
		in[2],
		clk,
		out_2
	);
	
	DFF_module dff3(
		in[3],
		clk,
		out_3
	);

endmodule