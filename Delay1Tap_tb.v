`timescale 10 ns/1 ns

module Delay1Tap_tb();


reg RESET;
reg CLOCK48K;
reg CLOCK12K;
reg [19:0] AudioIn;
	
wire [19:0] SRAMaddress; //see DE2-115 manual page 67-68
wire [19:0] AudioOut;
wire SRAM_nCE; 	//PIN_AF8 - Chip Enable Input (negative logic)
wire SRAM_nOE; 	//PIN_AD5 - Output Enable Input (negative logic)
wire SRAM_nWE;	//PIN_AE8 - Write Enable (negative logic)
wire SRAM_nUB;	//PIN_AC4 - Upper-byte Control (I/O8-I/O15)	
wire SRAM_nLB;	//PIN_AD4 - Lower-byte Control (I/O0-I/O7)
	
wire	[15:0] SRAMdata;
reg	[15:0] SRAMdata_driver;

Delay1Tap dut(
	RESET,
	CLOCK48K,
	CLOCK12K,
	AudioIn,
	
	SRAMaddress, //see DE2-115 manual page 67-68
	AudioOut,
	SRAM_nCE, 	//PIN_AF8 - Chip Enable Input (negative logic)
	SRAM_nOE, 	//PIN_AD5 - Output Enable Input (negative logic)
	SRAM_nWE,	//PIN_AE8 - Write Enable (negative logic)
	SRAM_nUB,	//PIN_AC4 - Upper-byte Control (I/O8-I/O15)	
	SRAM_nLB,	//PIN_AD4 - Lower-byte Control (I/O0-I/O7)
	
	SRAMdata
);


always begin
	#2;
	CLOCK48K = ~CLOCK48K;
end

initial begin
	CLOCK48K = 1'b0;
	RESET = 0;
	AudioIn = 16'd455;
	
	#4;
	RESET = 1;
	#4;
	RESET = 0;
	#4;
	
	#2200;
	$stop;

end

endmodule
