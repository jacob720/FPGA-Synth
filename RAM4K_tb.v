//4k testbench
//sophie watson
//23/01/23

`timescale 1 ns/100 ps


module RAM4K_tb;

	reg LOAD;
	reg [19:0] IN;
	reg [11:0] sel;
	reg clk;
	wire [19:0] OUT;
	
	
RAM4K dut (

   LOAD,
	IN,
	sel,
	clk,
	OUT
);


integer i;


initial begin 

   clk = 1'b0;
	#5;
	clk = 1'b1;
	#5;
	clk = 1'b0;
	LOAD = 1'b0;
	clk = 1'b1;
	#5;
	clk = 1'b0;
	#5;
 //get a clock cycle in
	
	clk = 1'b1; #5; clk = 1'b0; #5;
	LOAD = 1'b1;
	clk = 1'b1; #5; clk = 1'b0; #5;
	sel = 0; //should be first regester 1'b1111 - check out too
	clk = 1'b1; #5; clk = 1'b0; #5;
   IN = 15; //random number
	clk = 1'b1; #5; clk = 1'b0; #5;
	
	clk = 1'b1; #5; clk = 1'b0; #5;
	
	#20 //long gap just to show section
	
	clk = 1'b1; #5; clk = 1'b0; #5;
	sel = 3; //should be third regester 1'b11 - check out too //if there is a clock between these two itll put it in the wrong register
   IN = 3; //random number
	clk = 1'b1; #5; clk = 1'b0; #5;
	
	#20 //long gap just to show section
	
	//load = 1, tho following for loop should happen
	
	for ( i = 0; i < 2048; i = i + 1) 
	begin
	
	clk = 1'b1; #5; clk = 1'b0; #5;
	sel = i; //should be third regester 1'b11 - check out too
   IN = i; //so 0 reg should have 0, 1 should have 1 etc
	clk = 1'b1; #5; clk = 1'b0; #5;
	
	end
	
	clk = 1'b1; #5; clk = 1'b0; #5;
	#20 //long gap just to show section
	
	//load = 0 - the following for loop should not happen
	
	LOAD = 1'b0;
	clk = 1'b1; #5; clk = 1'b0; #5;
	
		for ( i = 0; i < 2048; i = i + 1) 
	begin
	
	clk = 1'b1; #5; clk = 1'b0; #5;
	sel = i; //should be third regester 1'b11 - check out too
   IN = i + 2; //so 0 reg should have 2, 1 should have 3 etc
	clk = 1'b1; #5; clk = 1'b0; #5;
	
	end
	

	
	$stop; //stop the simulation
	
end
	
endmodule
