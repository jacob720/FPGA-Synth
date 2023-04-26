module BYPASSFilter(
	input CLOCK48kHz,
	input FilterBypass,
	input [19:0] AudioLeftADSR,
	
	output reg [19:0] AudioLeftFilter

);

wire [19:0] FilterOut;

FilterTopLevel filt(CLOCK48kHz,AudioLeftADSR,16'b11011110001,16'b101001100111,16'b101001100111,16'b11011110001,FilterOut);

always @ (*) begin
	if (FilterBypass) begin
		AudioLeftFilter <= FilterOut;
	end
	else begin
		AudioLeftFilter <= AudioLeftADSR;
	end
end


endmodule