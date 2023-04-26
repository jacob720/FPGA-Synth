/* FourCellArrayRow.v

By: Jacob Williamson

Module Description:
An array row made up of four array cells for use in an array multiplier circuit.

Inputs:
a [3:0] - Bits of operand a.
b [3:0] - Bits of operand b.
sum_in [3:0] - Sums of columns.
c_in - Carry in from adjacent cell.

Outputs:
sum [3:0] - Sum of column.
c_out - Carry out bit.

*/

module FourCellArrayRow(
	input [3:0] a,
	input [3:0] b,
	input [3:0] sum_in,
	input c_in,
	output [3:0] sum,
	output c_out
);

	wire[2:0] w1;

	ArrayCell cell1(
		a[0],
		b[0],
		sum_in[0],
		c_in,
		sum[0],
		w1[0]
	);

	ArrayCell cell2(
		a[1],
		b[1],
		sum_in[1],
		w1[0],
		sum[1],
		w1[1]
	);

	ArrayCell cell3(
		a[2],
		b[2],
		sum_in[2],
		w1[1],
		sum[2],
		w1[2]
	);

	ArrayCell cell4(
		a[3],
		b[3],
		sum_in[3],
		w1[2],
		sum[3],
		c_out
	);

endmodule 
	