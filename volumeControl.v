//volume calculation that then goes into a memreg for miko

//

module volumeControl(

	input clk, //50mhz
	input [6:0]volumeBase, //volume as entered by the reset function - either 0 or -73db - 
	input [9:0] userInput, //user input from arduino, between 0-1023
	
	output wire [6:0]volume2DAC,
	output reg volchange //would use the negedge as this means that the volume has stopped changing
);


wire [6:0] volumeComp;
wire [6:0] toReg;
integer compare; //for t-1 vol
wire [6:0] volT2; //for t-2
wire carryO;//not needed
integer userinputscale; //to reduce the range



EightBitFullAdder EBFA1(

	volumeBase,
	userinputscale,
	1'b0,
	volumeComp,
	carryO
);


//or or0(volumeComp[0], volumeBase[0], userInput[3]); //adds the MSB user input to the lowest volume control so it should increas linearly
//or or1(volumeComp[1], volumeBase[1], userInput[4]);
//or or2(volumeComp[2], volumeBase[2], userInput[5]);
//or or3(volumeComp[3], volumeBase[3], userInput[6]);
//or or4(volumeComp[4], volumeBase[4], userInput[7]);
//or or5(volumeComp[5], volumeBase[5], userInput[8]);
//or or6(volumeComp[6], volumeBase[6], userInput[9]);


//(a,b,sel,out)
Mux21 mux0(7'b0000000, volumeComp[0], volumeBase[5], toReg[0] ); //use the 2nd msb of volComp as mux sel, as it will be high if the DAC is initialised
Mux21 mux1(7'b0000000, volumeComp[1], volumeBase[5], toReg[1] );
Mux21 mux2(7'b0000000, volumeComp[2], volumeBase[5], toReg[2] );
Mux21 mux3(7'b0000000, volumeComp[3], volumeBase[5], toReg[3] );
Mux21 mux4(7'b0000000, volumeComp[4], volumeBase[5], toReg[4] );
Mux21 mux5(7'b0000000, volumeComp[5], volumeBase[5], toReg[5] );
Mux21 mux6(7'b0000000, volumeComp[6], volumeBase[5], toReg[6] );

FrequencyMemReg reg1(

	toReg,
	1'b1,
	clk,
	volume2DAC
); 

FrequencyMemReg reg2(

	compare,
	1'b1,
	clk,
	volT2
); 



always @ (posedge clk)
	
	begin
		
		compare = volume2DAC;
		
		userinputscale = userInput/16;
		
		if (compare !== volT2) begin //if the two volatages a clock cycle a part are different, there has been a change - pulse
		
			volchange = 1;
			
		end
		
		else begin
		
			volchange = 0; //else there has not, so low
			
		end
		
			
		
	end



endmodule



