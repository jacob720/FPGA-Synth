//Sophie Watson
//22/1/23
//20 bit 2 option mux - only one select pin. For building into bigger 8 option mux

module Mux20thro (

 input [19:0] A,
 input [19:0] B,
 input sel,
 output wire [19:0] OUT

); 

Mux21 mux0 (A[0], B[0], sel, OUT[0]);

Mux21 mux1 (A[1], B[1], sel, OUT[1]);

Mux21 mux2 (A[2], B[2], sel, OUT[2]);

Mux21 mux3 (A[3], B[3], sel, OUT[3]);

Mux21 mux4 (A[4], B[4], sel, OUT[4]);

Mux21 mux5 (A[5], B[5], sel, OUT[5]);

Mux21 mux6 (A[6], B[6], sel, OUT[6]);

Mux21 mux7 (A[7], B[7], sel, OUT[7]);

Mux21 mux8 (A[8], B[8], sel, OUT[8]);

Mux21 mux9 (A[9], B[9], sel, OUT[9]);

Mux21 mux10 (A[10], B[10], sel, OUT[10]);

Mux21 mux11 (A[11], B[11], sel, OUT[11]);

Mux21 mux12 (A[12], B[12], sel, OUT[12]);

Mux21 mux13 (A[13], B[13], sel, OUT[13]);

Mux21 mux14 (A[14], B[14], sel, OUT[14]);

Mux21 mux15 (A[15], B[15], sel, OUT[15]);

Mux21 mux16 (A[16], B[16], sel, OUT[16]);

Mux21 mux17 (A[17], B[17], sel, OUT[17]);

Mux21 mux18 (A[18], B[18], sel, OUT[18]);

Mux21 mux19 (A[19], B[19], sel, OUT[19]);



endmodule
