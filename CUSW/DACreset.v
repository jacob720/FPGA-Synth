//DAC reset module
//Sophie Watson
//reset signal begins sequence again
//pulse
//counts to 127
//pulse
//counts to 127
//pulse
//uses the 12.288Mhz clock

module DACreset (

	input RESET,
	input clk12Mhz,
	output reg RESET_out,
	//output reg [7:0] iTest, //show counters
	//output reg [3:0] nTest, 
	output reg pulse,
	output reg DACReadyFlag

);

integer i = 1;
//integer n = 0;

always @ (posedge clk12Mhz) begin 

		if (RESET == 1) begin 
			i = 0;
			//n = 0;
			DACReadyFlag = 0;
			RESET_out = 1;
			end
			
		else if (i<300) begin 
			
			RESET_out = 0;
		
			if (i == 0) begin
				pulse = 1;
			
			end 
		
		
			else if (i == 1) begin
		
				pulse = 0;
		
			end
		
		
			else if (i == 128) begin
		
				pulse = 1;
		
			end
		
			else if (i == 129) begin
		
				pulse = 0;
			
			end
			
			
			else if (i == 256) begin
		
				pulse = 1;
		
			end
		
			else if (i == 257) begin
		
				pulse = 0;
				DACReadyFlag = 1;
			
			end
		
		i = i + 1;
		
		end
			
	//iTest = i;
	//nTest = n;
		
end




endmodule 



