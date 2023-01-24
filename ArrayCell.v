/* ArrayCell.v

By: Jacob Williamson

Module Description:
An array cell for use in an array multiplier circuit.

Inputs:
a - A certian bit of operand a.
b - A certain bit of operand b.
sum_in - Current sum of column.
c_in - Carry in bit from adjacent cell.

Outputs:
sum - Sum of column.
c_out - Carry out bit.

*/

module ArrayCell(
	input a,
	input b,
	input sum_in,
	input c_in,
	output sum,
	output c_out
);
	
	wire partial_product;
	
	and(partial_product, a, b);
	
	OneBitFullAdder adder1(
		partial_product, 
		sum_in, 
		c_in, 
		sum, 
		c_out
	);
	
endmodule 
