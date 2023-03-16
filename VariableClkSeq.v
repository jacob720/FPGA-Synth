//variable clock, that selects the clock output from 10 possible times from the user input
//SW, 25/2/23

module VariableClkSeq (

input clk100hz,
input [9:0] user_input0,
output reg variableClk

);

integer i =0;


always@(posedge clk100hz) begin
	
	if (user_input0 > 10'b1110000101) begin //901:1000 - > 12 - - 40s clk
		if ( i > 2000) begin
           		variableClk = 1'b0;  
			if (i >= 4000) begin
				i = 0;
			end
		end
		
        else begin 
        		variableClk = 1'b1;
        end  
	end
	
	
	else if (user_input0 > 10'b1100100001) begin //801:900 -> 11 -- 35s
		if ( i > 1750) begin
           		variableClk = 1'b0;  
			if (i >= 3500) begin
				i = 0;
			end
		end
		
        else begin 
        		variableClk = 1'b1;
        end 
	end
		
	else if (user_input0 > 10'b1010111101) begin //701:800 -> 10 -- 30s
		if ( i > 1500) begin
           		variableClk = 1'b0;  
			if (i >= 3000) begin
				i = 0;
			end
		end
		
        else begin 
        		variableClk = 1'b1;
        end 
	end
		
	else if (user_input0 > 10'b1001011001) begin //601:700 -> 9 -- 25s
		if ( i > 1250) begin
           		variableClk = 1'b0;  
			if (i >= 2500) begin
				i = 0;
			end
		end
		
        else begin 
        		variableClk = 1'b1;
        end 
	end
	
	else if (user_input0 > 9'b111110101) begin //501:600 -> 8 -- 20s
		if ( i > 1000) begin
           		variableClk = 1'b0;  
			if (i >= 2000) begin
				i = 0;
			end
		end
		
        else begin 
        		variableClk = 1'b1;
        end 
	end
	
	else if (user_input0 > 9'b110010001) begin //401:500 -> 7 -- 15s
		if ( i > 750) begin
           		variableClk = 1'b0;  
			if (i >= 1500) begin
				i = 0;
			end
		end
		
        else begin 
        		variableClk = 1'b1;
        end 
	end
	
	
	else if (user_input0 > 9'b100101101) begin //301:400 -> 6 -- 10s
		if ( i > 500) begin
           		variableClk = 1'b0;  
			if (i >= 1000) begin
				i = 0;
			end
		end
		
        else begin 
        		variableClk = 1'b1;
        end 
	end
	

	else if (user_input0 > 8'b11001001) begin //201:300 -> 5 -- 5s
		if ( i > 250) begin
           		variableClk = 1'b0;  
			if (i >= 500) begin
				i = 0;
			end
		end
		
        else begin 
        		variableClk = 1'b1;
        end 
	end
	
	else if (user_input0 > 7'b1100101) begin //101:200 -> 4 -- 2.5s
		if ( i > 125) begin
           		variableClk = 1'b0;  
			if (i >= 250) begin
				i = 0;
			end
		end
		
        else begin 
        		variableClk = 1'b1;
        end 
	end
	
	else if (user_input0 > 0) begin //0:  100 -> 3 -- 1s
		if ( i > 50) begin
           		variableClk = 1'b0;  
			if (i >= 100) begin
				i = 0;
			end
		end
		
        else begin 
        		variableClk = 1'b1;
        end 
	end

	else begin
		if ( i > 25) begin //catch clause, 0.5s
           		variableClk = 1'b0;  
			if (i >= 50) begin
				i = 0;
			end
		end
		
        else begin 
        		variableClk = 1'b1;
        end 
	end

	i = i + 1;	
		
 end
 
 
 endmodule