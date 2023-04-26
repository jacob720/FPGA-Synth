//janes counter module that ive edited
//4 bit counter for the trigger module


module Counter_4bitSW(
	input clk, //variable clk input
	input reset,
	output reg [3:0]count,
	output reg end_count
);

	always @ (posedge clk) begin
	
		count = count + 1;
	
		if (count!=4'b1111) begin
			end_count = 1'b0;
		end 
		
		else if (count ==4'b1111) begin
			end_count = 1'b1;
		end
	
		else if (reset) begin
			end_count = 1'b0;
			count = 4'b0000;
		end
	
	end

endmodule
