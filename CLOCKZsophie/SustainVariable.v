//sustain value from the user input
//input is in the range 0-1023 from arduino
//output range is 3-12
//clk input is board clk - needs to run quickly so that it auto updates

module SustainVariable(

 input [9:0] user_input0,
 input clk,
 output reg [3:0] sustainTime // needs to be in the range 0-4

);


always@(posedge clk) begin
	
	if (user_input0 > 10'b1110000101) begin //801:1000 - > 4
		sustainTime = 4'b0100;
		end
	else if (user_input0 > 10'b1010111101) begin //601:800 -> 3
		sustainTime = 4'b0011;
		end
	else if (user_input0 > 9'b111110101) begin //401:600 -> 2
		sustainTime = 4'b0010;
		end
	else if (user_input0 > 9'b100101101) begin //201:400 -> 1
		sustainTime = 4'b0001;
		end
	else if (user_input0 > 7'b1100101) begin //101:200 -> 0
		sustainTime = 4'b0000;
		end
	
	else begin
		sustainTime = 4'b0000; //is 0 as a fail safe
		end

 end

endmodule
