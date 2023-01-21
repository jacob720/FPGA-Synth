//testbench for the onebitreg
//created by sophie watson
//19/1/23

//timescale

`timescale 1 ns/100 ps

//device, ins and outs
module OneBitReg_tb;

	reg IN;
	reg LOAD;
	reg clk;
	wire OUT;

//instantiate dut

OneBitReg dut (

	IN,
	LOAD,
	clk,
	OUT //last one in a bracket doesnt have a comma

);
//create stimulus

initial begin 

   clk = 1'b0;
	#5;
	clk = 1'b1;
	#5;
	clk = 1'b0;
	#5;
	clk = 1'b1;
	#5;
	clk = 1'b0;
	#5;

	IN = 1'b0;
	LOAD = 1'b0; //check nothing happens when load = 0
	#10; //wait - seperating the test vectors with delays applies them sequentially, as does =
	clk = 1'b1; #5; clk = 1'b0; #5;

	IN = 1'b1;
	LOAD = 1'b0; //check nothing happens when load = 0
	#10; //wait
	clk = 1'b1; #5; clk = 1'b0; #5;
	
	IN = 1'b0;
	LOAD = 1'b1; //should load in 0
	#10; //wait
	clk = 1'b1; #5; clk = 1'b0; #5;
	
	IN = 1'b1;
	LOAD = 1'b1; //should load in 1
	#10; //wait
	clk = 1'b1; #5; clk = 1'b0; #5;
	#10; //wait
	
	$stop; //stop the simulation
	
end
	
endmodule
	
