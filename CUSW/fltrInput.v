//filter conversion 
//sophie watson

	module fltrInput(
	
	input clk, //50mhz is fine
	input [9:0] P0, //user pot in 0
	input [9:0] P1, //user pot in 1
	
	output reg [1:0] filterSel, //2 bit control
	output reg [1:0] cuttoff //0-2
	
);
	
	
	always @ (posedge clk)
	
	begin
		
		filterSel = P0[9:8];
		
		cuttoff = P1[9:8];
		
			if (cuttoff == 2'b11) begin //restricting it to have a 0-2 bit range by removing 3
				cuttoff = 2'b10;
				
			end 
				
			
		
	end
	
endmodule
