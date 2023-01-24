//8 bit ram
//8 lots of 20
//sophie watson
//23/01/23


module RAM8 (

	input LOAD,
	input [19:0] IN,
	input [2:0] sel,
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


DMux8Way Dmux0(LOAD, sel, xIN[0], xIN[1], xIN[2], xIN[3], xIN[4], xIN[5], xIN[6], xIN[7]); //(in, sel, outs)

FrequencyMemReg Reg0(IN, xIN[0], clk, AOUT); //(IN, load, clk, out)

FrequencyMemReg Reg1(IN, xIN[1], clk, BOUT);

FrequencyMemReg Reg2(IN, xIN[2], clk, COUT);

FrequencyMemReg Reg3(IN, xIN[3], clk, DOUT);

FrequencyMemReg Reg4(IN, xIN[4], clk, EOUT);

FrequencyMemReg Reg5(IN, xIN[5], clk, FOUT);

FrequencyMemReg Reg6(IN, xIN[6], clk, GOUT);

FrequencyMemReg Reg7(IN, xIN[7], clk, HOUT);

Mux20thro8way Mux0(AOUT, BOUT, COUT, DOUT, EOUT, FOUT, GOUT, HOUT, sel, OUT);// (A,B,C,D,E,F,G,H, sel, out)

endmodule
