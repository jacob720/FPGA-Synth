
module ClockDiv_99_reset(

	input clk,
	input [18:0] Cin,
	output reg reset


);


always @ (posedge clk) begin 
	
			if (Cin >= 19'b1111010000100100000) //will reset the code if it is greater than or equal to 99
				reset <= 1'b0; //active low, so set to 0
			
			else 
				reset <= 1'b1; //therefore when timeOut = x, intialises as 1, not causing a pos edge 
	end
			
		
			
endmodule
