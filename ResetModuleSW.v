//a reset module for the board that sets all the intial values 
//areset on the PLL needs to go high then low
//Volume for DAC = 0 (to avoid any random glitching, or a harsh click on the first note)
//Some indication to the user that the synth is restarting?
//Initial values for the pots set - ADSR, filter, osc, seq and effects_E, and volume - only one enable value needed
//Reset (reset active high) and reset_n (reset active low) need to occur


module ResetModuleSW (

	input clk, //50mhz on board system clock
	input locked, //locked PLL signal
	input DACReadyFlag, //DAC hs reset properly
	
	output reg [6:0] volume, //for the dac
	
	output reg areset, //for the PLL

	output reg reset_enable, //for pot values
	output reg reset, //active hive reset
	output reg reset_n, //active low reset
	output reg readyFlag //ready flag for arduino
);


integer i = 0; //a counter so that these will happen sequentially
integer x = 0; //from when the clock has properly locked

always @ (posedge clk) begin 
	
			if (i == 0) begin
			
				volume = 7'b0000000;
				areset = 1'b0;
				reset  = 1'b0; //intial value
				reset_n  = 1'b1; //intial value
				reset_enable = 1'b0;
				readyFlag = 1'b0;
			
			end
			
			else if (i == 10) begin
			
				areset = 1'b1; //high
			
			end
			
			else if (i == 12) begin
			
				areset = 1'b0; //low again
			
			end
			
			else if (x == 8) begin 
			
			reset  = 1'b0; //deactivated
			reset_n  = 1'b1; //deactivated
			readyFlag = 1'b1;
			
			reset_enable = 1'b1;
				
				x = 9;
			
			end
			
			else if (x == 7) begin  // a delay of clock cycles to allow reset for slower clock
				
				x = 8;
			
			end
			
			else if (x == 6) begin  // a delay of clock cycles to allow reset for slower clock
				
				x = 7;
			
			end
			
			else if (x == 5) begin  // a delay of clock cycles to allow reset for slower clock
				
				x = 6;
			
			end
			
			else if (x == 4) begin  // a delay of clock cycles to allow reset for slower clock
				
				x = 5;
			
			end
			
			else if (x == 3) begin  // a delay of clock cycles to allow reset for slower clock
				
				x = 4;
			
			end
			
			else if (x == 2) begin 
			
				
				
				x = 3;
			
			end
			
			else if (x == 1) begin 
				
				
				x = 2;
			
			end
			
			else if (locked == 1 && x == 0) begin
				
				reset  = 1'b1; //active
				reset_n  = 1'b0; //active
				
				x = 1;
				
			end 
			
			else if (i >= 100 && x == 9 && DACReadyFlag == 1) begin // should only work once the memory register have been loaded and dac reset
			
				reset_enable = 1'b0;
				volume = 7'b0110000;
				
			end
					
		i = i + 1;
		//xn = x;
		
	end
			
		
			
endmodule


//Order:
//
//- the volume set to 000000, so that as soon as the dac is clocked the volume is 0
//- arest, with a delay for high and low
//- a period of time left for the PLL to clock - at least 10 clock cycles after running PLL simulations
//- reset set 0, 1, 0, and reset_n set 1,0,1 with delays between points - needs to be reset first so flipflops working for registers
//- enable set high, then delay to make sure its loaded into mem reg, then set low
//add in mikos stuff before the x goes to 5
//- volume set at constant 0110000 (as minimum, -73db)

