module SR32CLOCKdriver(

input I2CMasterClock,
input ORcount,
input RESET,

output reg SRegClock

);

//wire for condition
//wire ORcount;

//SReg32Bit clock driver
always @(negedge I2CMasterClock or negedge ORcount or negedge ~RESET) begin
	if(ORcount == 0) begin
		SRegClock <= 1;
	end else if (RESET == 1) begin
		SRegClock <= 0;
	end else begin
		SRegClock <= ~SRegClock;
	end
end


//condition definition
//or(ORcount, count[5], count[4], count[3], count[2], count[1], count[0]);

endmodule
