module Delay1Tap(
	input RESET,
	input CLOCK48K,
	input CLOCK12K,
	input [19:0] AudioIn,
	
	output reg [19:0] SRAMaddress, //see DE2-115 manual page 67-68
	output [19:0] AudioOut,
	output reg SRAM_nCE, 	//PIN_AF8 - Chip Enable Input (negative logic)
	output reg SRAM_nOE, 	//PIN_AD5 - Output Enable Input (negative logic)
	output reg SRAM_nWE,	//PIN_AE8 - Write Enable (negative logic)
	output reg SRAM_nUB,	//PIN_AC4 - Upper-byte Control (I/O8-I/O15)	
	output reg SRAM_nLB,	//PIN_AD4 - Lower-byte Control (I/O0-I/O7)
	
	inout [15:0] SRAMdata
);

reg [15:0] tap1;
wire [17:0] count;
wire redundant;
reg [19:0] AddressReg;
localparam Base_SRAM_address = 20'd400;
localparam Zdelay = 10000;


//driving SRAMdata
wire [15:0] SRAM_dataOutWire;
reg [15:0] SRAM_dataInReg;

//assign SRAM_dataWire = SRAM_dataInReg;

TriStateDriver16bit IOportSRAMdata(
	SRAM_nWE, SRAM_dataInReg, SRAM_dataOutWire, SRAMdata
);

//we're only using 18bits address of SRAM
//assign AddressWire[19:18] = 2'b10;
//SRAMaddress[19:18] = AddressWire[19:18];

Counter18bit counterDELAY( CLOCK48K, RESET, count );


always @ (CLOCK48K) begin

if(CLOCK48K) begin
	//read previous input from memory
	SRAMaddress = Base_SRAM_address+count;
	//SRAM_dataInReg = 16'hFF;
	tap1 = SRAM_dataOutWire;
	//SRAM config params
	SRAM_nWE = 1'b1;
	SRAM_nCE = 1'b0;
	SRAM_nOE = 1'b0;
	SRAM_nUB = 1'b0;
	SRAM_nLB = 1'b0;
	
	
end else begin
	//write current input to memorys
	SRAMaddress = Base_SRAM_address+count+Zdelay;
	//tap1 = SRAMdata;
	SRAM_dataInReg = AudioIn[19:4];

	//SRAM config params
	SRAM_nWE = 1'b0;
	SRAM_nCE = 1'b0;
	SRAM_nOE = 1'b0;
	SRAM_nUB = 1'b0;
	SRAM_nLB = 1'b0;
end
	
end

//audio out
//SixteenBitFullAdder mixer( AudioIn, tap1, 1'b0, AudioOut, redundant );

//assign AudioOut[19:4] = SRAM_dataOutWire;
assign AudioOut[19:4] = 15'h0000;
assign AudioOut[3:0] = AudioIn[3:0];

endmodule
