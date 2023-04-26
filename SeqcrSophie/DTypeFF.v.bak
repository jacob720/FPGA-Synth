module DTypeFF(
	input clk,
	input reset_n,
	input D,
	output reg Q
	//need to define as a register or it will default ot a wire and you cant procedurally assign a wire
);

 
	always @ (posedge clk or negedge reset_n) begin //clk and reset in the same always block as they both deal with q
		
		if(reset_n == 1'b0) //to reset the device as reset is active low, if it is low then we need to reset it, and set q to 1
		
			Q <= 1'b0; 
		
		else
		
			Q <= D; //can't manipulate q in two differnt always blocks
		

	end

	

endmodule 

