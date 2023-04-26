//delay of 2 clock cycles
//Master-Slave Flipflops

module Delay1CC(
	input CLOCK,
	input [17:0] D,
	
	output reg [17:0] Q
);

reg [17:0] Interconnect;

always @ (posedge CLOCK) begin
	Q <= D;
end

//always @ (negedge CLOCK) begin
//	Q <= Interconnect;
//end

endmodule

