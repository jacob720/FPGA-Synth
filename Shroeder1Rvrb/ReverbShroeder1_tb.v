`timescale 1 ns/100ps

module ReverbShroeder1_tb();

reg CLOCK48kHz;
reg RESET;
reg [19:0] audioIn;
reg K;

wire [19:0] audioOut;


//AllPassFilter dut( CLOCK48kHz, RESET, audioIn, K1, K2, audioOut );
ReverbShroeder1 dut( RESET, CLOCK48kHz, audioIn, audioOut );

always begin
	#1;
	CLOCK48kHz = ~CLOCK48kHz;
end

initial begin
//initial parameter values
	CLOCK48kHz = 1'b0;
	audioIn = 20'd0;
	RESET = 1'b0;
	K = 1'b1;
	
	#3;
	RESET <= 1'b1;
	#3;
	RESET <= 1'b0;
	#3;
	audioIn <= 20'd4095;
	#50;
	RESET <= 1'b1;
	#40;
	RESET <= 1'b0;
	#50;
	audioIn <= 20'd0;
	#10;
	audioIn <= 20'd4095;
	#140;
	audioIn <= 20'd0;
	#30;
	audioIn <= 20'd4095;
	#3;
	audioIn <= 20'd0;
	#6000;
	
	$stop;
	
end

endmodule 
