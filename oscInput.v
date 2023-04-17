//oscillator conversion 
//sophie watson

	module oscInput(
	
	input clk, //50mhz is fine
	input [9:0] P0, //user pot in 0
	input [9:0] P1, //user pot in 1
	
	output reg [1:0] waveform, //2 bit control
	output reg [3:0] detune //4 bit control
	
);
	
	
	always @ (posedge clk)
	
	begin
		
		waveform = P0[9:8];
		
		detune = P1[9:6];
			
		
	end
	
	
endmodule
