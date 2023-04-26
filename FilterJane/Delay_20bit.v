module Delay_20bit(
	input clk,
	input [19:0]in,
	output [19:0]out
);

wire [19:0] out0;
wire clk_n;

not(clk_n,clk);

DTypeFF master0(
	clk,
	in[0],
	out0[0]
);

DTypeFF master1(
	clk,
	in[1],
	out0[1]
);

DTypeFF master2(
	clk,
	in[2],
	out0[2]
);

DTypeFF master3(
	clk,
	in[3],
	out0[3]
);

DTypeFF master4(
	clk,
	in[4],
	out0[4]
);

DTypeFF master5(
	clk,
	in[5],
	out0[5]
);

DTypeFF master6(
	clk,
	in[6],
	out0[6]
);

DTypeFF master7(
	clk,
	in[7],
	out0[7]
);

DTypeFF master8(
	clk,
	in[8],
	out0[8]
);

DTypeFF master9(
	clk,
	in[9],
	out0[9]
);

DTypeFF master10(
	clk,
	in[10],
	out0[10]
);

DTypeFF master11(
	clk,
	in[11],
	out0[11]
);

DTypeFF master12(
	clk,
	in[12],
	out0[12]
);

DTypeFF master13(
	clk,
	in[13],
	out0[13]
);

DTypeFF master14(
	clk,
	in[14],
	out0[14]
);

DTypeFF master15(
	clk,
	in[15],
	out0[15]
);

DTypeFF master16(
	clk,
	in[16],
	out0[16]
);

DTypeFF master17(
	clk,
	in[17],
	out0[17]
);

DTypeFF master18(
	clk,
	in[18],
	out0[18]
);

DTypeFF master19(
	clk,
	in[19],
	out0[19]
);

DTypeFF slave0(
	clk_n,
	out0[0],
	out[0]
);

DTypeFF slave1(
	clk_n,
	out0[1],
	out[1]
);

DTypeFF slave2(
	clk_n,
	out0[2],
	out[2]
);

DTypeFF slave3(
	clk_n,
	out0[3],
	out[3]
);

DTypeFF slave4(
	clk_n,
	out0[4],
	out[4]
);

DTypeFF slave5(
	clk_n,
	out0[5],
	out[5]
);

DTypeFF slave6(
	clk_n,
	out0[6],
	out[6]
);

DTypeFF slave7(
	clk_n,
	out0[7],
	out[7]
);

DTypeFF slave8(
	clk_n,
	out0[8],
	out[8]
);

DTypeFF slave9(
	clk_n,
	out0[9],
	out[9]
);

DTypeFF slave10(
	clk_n,
	out0[10],
	out[10]
);

DTypeFF slave11(
	clk_n,
	out0[11],
	out[11]
);

DTypeFF slave12(
	clk_n,
	out0[12],
	out[12]
);

DTypeFF slave13(
	clk_n,
	out0[13],
	out[13]
);

DTypeFF slave14(
	clk_n,
	out0[14],
	out[14]
);

DTypeFF slave15(
	clk_n,
	out0[15],
	out[15]
);

DTypeFF slave16(
	clk_n,
	out0[16],
	out[16]
);

DTypeFF slave17(
	clk_n,
	out0[17],
	out[17]
);

DTypeFF slave18(
	clk_n,
	out0[18],
	out[18]
);

DTypeFF slave19(
	clk_n,
	out0[19],
	out[19]
);

endmodule
