//sustain value from the user input
//input is in the range 0-1023 from arduino
//output range is 3-12


module SustainVariable(

 input user_input0,
 input clk,
 output reg [3:0] sustainTime

);


always@(posedge clk) begin

 if (user_input0 > 10'd1000) begin
			sustainTime = 10'd12;
	end
	 
 else if (user_input0 > 10'd900) begin
			sustainTime = 10'd11;
	end
	
 else if (user_input0 > 10'd700) begin
			sustainTime = 10'd10;
	end
	
 else if (user_input0 > 10'd600) begin
			sustainTime = 10'd9;
	end
	
 else if (user_input0 > 10'd500) begin
			sustainTime = 10'd8;
	end
	
 else if (user_input0 > 10'd400) begin
			sustainTime = 10'd7;
	end
	
 else if (user_input0 > 10'd300) begin
			sustainTime = 10'd6;
	end
	
 else if (user_input0 > 10'd200) begin
			sustainTime = 10'd5;
	end
	
 else if (user_input0 > 10'd100) begin
			sustainTime = 10'd4;
	end

else begin 
		sustainTime = 10'd3;
	end



end

endmodule