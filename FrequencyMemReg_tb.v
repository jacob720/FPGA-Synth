//sophie watson
//testbench for the frequency register

`timescale 1 ns/100 ps

//device, ins and outs
module FrequencyMemReg_tb;

	reg [19:0] IN;
	reg LOAD;
	reg clk;
	wire [19:0] OUT;

//instantiate dut

FrequencyMemReg dut (

	IN,
	LOAD,
	clk,
	OUT //last one in a bracket doesnt have a comma

);

integer i; //iterator

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
	
	clk = 1'b1; #5; clk = 1'b0; #5;
   IN = 79021; //random number
	clk = 1'b1; #5; clk = 1'b0; #5;
	LOAD = 1'b1;
	#10; //wait 
	clk = 1'b1; #5; clk = 1'b0; #5;

	IN = 1'b00000000000000000000;
	clk = 1'b1; #5; clk = 1'b0; #5;
	LOAD = 1'b1; //will load 0 into all of the DFF
	#10; //wait 
	clk = 1'b1; #5; clk = 1'b0; #5;
	
	for ( i = 0; i < 499; i = i + 1) //verilog has a limit of 500. thanks bae.
	begin
	
	IN = i;
	#5;
	clk = 1'b1; #5; clk = 1'b0; #5; //clk cycle
	
	end
	clk = 1'b1; #5; clk = 1'b0; #5;
	IN = 1'b00000000000000000000;
	clk = 1'b1; #5; clk = 1'b0; #5;
	LOAD = 1'b1; //will load 0 into all of the DFF
	#10; //wait 
	clk = 1'b1; #5; clk = 1'b0; #5;
	
	LOAD = 1'b0; //shouldnt load back in
	#10; //wait 
	
	clk = 1'b1; #5; clk = 1'b0; #5;
	
	for ( i = 0; i < 499; i = i + 1) 
	begin
	
	IN = i;
	#5;
	clk = 1'b1; #5; clk = 1'b0; #5;
	
	end
	

	
	$stop; //stop the simulation
	
end
	
endmodule
	
