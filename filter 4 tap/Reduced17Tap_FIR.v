module Reduced17Tap_FIR(
	input clk,
	input [19:0] in,
	input [15:0] h0,
	input [15:0] h1,
	input [15:0] h2,
	input [15:0] h3,
	input [15:0] h4,
	input [15:0] h5,
	input [15:0] h6,
	input [15:0] h7,
	input [15:0] h8,
	output [19:0] out
);

//wire signed [15:0] coefficients [0:8];

wire [19:0] z0;
wire [19:0] z1;
wire [19:0] z2;
wire [19:0] z3;
wire [19:0] z4;
wire [19:0] z5;
wire [19:0] z6;
wire [19:0] z7;
wire [19:0] z8;
wire [19:0] z9;
wire [19:0] z10;
wire [19:0] z11;
wire [19:0] z12;
wire [19:0] z13;
wire [19:0] z14;
wire [19:0] z15;
wire [19:0] z16;

reg [39:0] add0;
reg [39:0] add1;
reg [39:0] add2;
reg [39:0] add3;
reg [39:0] add4;
reg [39:0] add5;
reg [39:0] add6;
reg [39:0] add7;

reg [39:0] mult0;
reg [39:0] mult1;
reg [39:0] mult2;
reg [39:0] mult3;
reg [39:0] mult4;
reg [39:0] mult5;
reg [39:0] mult6;
reg [39:0] mult7;
reg [39:0] mult8;

reg [39:0] add_0;
reg [39:0] add_1;
reg [39:0] add_2;
reg [39:0] add_3;
reg [39:0] add_4;
reg [39:0] add_5;
reg [39:0] add_6;
reg [39:0] add_7;

//integer i;
//integer file;
//
//file=$fopen("coefs.h","r");
//while(!$feof(file))begin
//	//$fscanf(file,"%d",coefficients
//	$fscanf(file,"%d\n",coefficients);
//end
//$fclose(file);
//assign {coefficients[0],coefficients[1],coefficients[2],coefficients[3],coefficients[4],coefficients[5],coefficients[6],coefficients[7],coefficients[8]} =`include "coefs.h";

Delay_20bit d0(
	clk,
	in,
	z0
);

Delay_20bit d1(
	clk,
	z0,
	z1
);

Delay_20bit d2(
	clk,
	z1,
	z2
);

Delay_20bit d3(
	clk,
	z2,
	z3
);

Delay_20bit d4(
	clk,
	z3,
	z4
);

Delay_20bit d5(
	clk,
	z4,
	z5
);

Delay_20bit d6(
	clk,
	z5,
	z6
);

Delay_20bit d7(
	clk,
	z6,
	z7
);

Delay_20bit d8(
	clk,
	z7,
	z8
);

Delay_20bit d9(
	clk,
	z8,
	z9
);

Delay_20bit d10(
	clk,
	z9,
	z10
);

Delay_20bit d11(
	clk,
	z10,
	z11
);

Delay_20bit d12(
	clk,
	z11,
	z12
);

Delay_20bit d13(
	clk,
	z12,
	z13
);

Delay_20bit d14(
	clk,
	z13,
	z14
);

Delay_20bit d15(
	clk,
	z14,
	z15
);

Delay_20bit d16(
	clk,
	z15,
	z16
);

always @ (*) begin
	add0 <= z0 + z16;
	add1 <= z1 + z15;
	add2 <= z2 + z14;
	add3 <= z3 + z13;
	add4 <= z4 + z12;
	add5 <= z5 + z11;
	add6 <= z6 + z10;
	add7 <= z7 + z9;
	
//	mult0 <= add0 * h0;
//	mult1 <= add1 * h1;
//	mult2 <= add2 * h2;
//	mult3 <= add3 * h3;
//	mult4 <= add4 * h4;
//	mult5 <= add5 * h5;
//	mult6 <= add6 * h6;
//	mult7 <= add7 * h7;
//	mult8 <= z8 * h8;
	
	mult0 <= add0 * coefficients[0];
	mult1 <= add1 * coefficients[1];
	mult2 <= add2 * coefficients[2];
	mult3 <= add3 * coefficients[3];
	mult4 <= add4 * coefficients[4];
	mult5 <= add5 * coefficients[5];
	mult6 <= add6 * coefficients[6];
	mult7 <= add7 * coefficients[7];
	mult8 <= z8 * coefficients[8];
	
	add_0 <= mult8 + mult7;
	add_1 <= add_0 + mult6;
	add_2 <= add_1 + mult5;
	add_3 <= add_2 + mult4;
	add_4 <= add_3 + mult3;
	add_5 <= add_4 + mult2;
	add_6 <= add_5 + mult1;
	add_7 <= add_6 + mult0;

end
assign out = add_7[39:20];

endmodule