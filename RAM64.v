//64 bit RAM - 8 lots of 8ram
//sophie watson
//24/01/23


module RAM64 (

	input LOAD,
	input [19:0] IN,
	input [5:0] sel,
	input clk,
	output wire [19:0] OUT

);

wire [7:0] xIN; // for connecting dmux to registers
wire [19:0] AOUT; //for connecting registers to mux
wire [19:0] BOUT;
wire [19:0] COUT;
wire [19:0] DOUT;
wire [19:0] EOUT;
wire [19:0] FOUT;
wire [19:0] GOUT;
wire [19:0] HOUT;


DMux8Way DMux0(LOAD, sel[5:3], xIN[0], xIN[1], xIN[2], xIN[3], xIN[4], xIN[5], xIN[6], xIN[7]); //(in, sel, outs)

RAM8 RAM0(xIN[0], IN, sel[2:0], clk, AOUT); //(LOAD, IN, sel, clk, out)

RAM8 RAM1(xIN[1], IN, sel[2:0], clk, BOUT); //(LOAD, IN, sel, clk, out)

RAM8 RAM2(xIN[2], IN, sel[2:0], clk, COUT); //(LOAD, IN, sel, clk, out)

RAM8 RAM3(xIN[3], IN, sel[2:0], clk, DOUT); //(LOAD, IN, sel, clk, out)

RAM8 RAM4(xIN[4], IN, sel[2:0], clk, EOUT); //(LOAD, IN, sel, clk, out)

RAM8 RAM5(xIN[5], IN, sel[2:0], clk, FOUT); //(LOAD, IN, sel, clk, out)

RAM8 RAM6(xIN[6], IN, sel[2:0], clk, GOUT); //(LOAD, IN, sel, clk, out)

RAM8 RAM7(xIN[7], IN, sel[2:0], clk, HOUT); //(LOAD, IN, sel, clk, out)


Mux20thro8way Mux0(AOUT, BOUT, COUT, DOUT, EOUT, FOUT, GOUT, HOUT, sel[5:3], OUT);// (A,B,C,D,E,F,G,H, sel, out)

endmodule
