module I2CCounterControlLogic(
	input RESET,
	input InitialiseTransfer,
	input [5:0] count,
	
	output reg CountReset //resets counter
);

//condition for end of transfer
wire Binary56;


//if RESET is turned on, CountReset activates (posedge)
//if InitialiseTransfer is turned on, counter starts incrementing (posedge)

always @( posedge RESET or posedge InitialiseTransfer or posedge Binary56) begin
	if(RESET) begin
		CountReset <= 1;
	end else if (Binary56) begin
		CountReset <= 1;
	end else if (InitialiseTransfer) begin
		CountReset <= 0;
	end
end
	

and(Binary56, count[5], count[4], count[3], ~count[2], ~count[1], ~count[0]);

endmodule
