/* TwentyCellArrayRow.v

By: Jacob Williamson

Module Description:
An array row made up of twenty array cells for use in an array multiplier circuit.

Inputs:
a [19:0] - Bits of operand a.
b [19:0] - Bits of operand b.
sum_in [19:0] - Sums of columns.

Outputs:
sum [19:0] - Sum of column.
c_out - Carry out bit.

*/

module TwentyCellArrayRow(
	input [19:0] a,
	input [19:0] b,
	input [19:0] sum_in,
	output [19:0] sum,
	output c_out
);

	wire [3:0] w1;
	
	FourCellArrayRow partial_row1(
		a[3:0],
		b[3:0],
		sum_in[3:0],
		1'b0,
		sum[3:0],
		w1[0]
	);
	
	FourCellArrayRow partial_row2(
		a[7:4],
		b[7:4],
		sum_in[7:4],
		w1[0],
		sum[7:4],
		w1[1]
	);
	
	FourCellArrayRow partial_row3(
		a[11:8],
		b[11:8],
		sum_in[11:8],
		w1[1],
		sum[11:8],
		w1[2]
	);
	
	FourCellArrayRow partial_row4(
		a[15:12],
		b[15:12],
		sum_in[15:12],
		w1[2],
		sum[15:12],
		w1[3]
	);
	
	FourCellArrayRow partial_row5(
		a[19:16],
		b[19:16],
		sum_in[19:16],
		w1[3],
		sum[19:16],
		c_out
	);
	
endmodule 
