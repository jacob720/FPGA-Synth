module ClockDivider50MHzTo100Hz (
	input CLK_50_MHz,
	input reset_n,
	output reg CLK_100Hz	
	
);


wire [18:0] C; //output of the counter
wire n; //output from the comparator - the new clock signal to be assigned to the register

wire reset_mux;
wire reset;

Counter100Hz clockdivcount (
	CLK_50_MHz,
	reset_mux,
	C //output from the counter
	
);

Comparator Comparator1 (

	CLK_50_MHz,
	C,
	n //the new clock signal
);

ClockDiv_99_reset clockdivreset(

	CLK_50_MHz,
	C,
	reset


);

Mux21 clockdivmux(

	reset_n,
	reset,
	reset_n,
	reset_mux

);

//assigning n to the output register
always @ ( posedge CLK_50_MHz) begin //so CLK_100Hz outputs as a register
		
		CLK_100Hz <= n;
		
	end

	
endmodule
