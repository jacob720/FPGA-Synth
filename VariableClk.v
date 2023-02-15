//module that takes the user input (pot value from 0-1023) and a 100hx clock and turns it into a variable clock
//for the ADSR filter
//0.05-5s


module VariableClk (

	input clk,
	input [9:0] user_input0,
	output reg variableClk


);

integer i = 0;
integer x = 0;
	
	
	
always@(posedge clk) begin
	if ( i> user_input0/2) begin
           		variableClk = 1'b0;  
		if (i >= user_input0) begin
			i = 0;
		end
	end
        else begin //so the total period of the wave is the same as the user input
        		variableClk = 1'b1;
        end  
		  i = i + 1;
     end

			
endmodule








