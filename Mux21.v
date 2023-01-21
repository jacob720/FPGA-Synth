//taken from https://technobyte.org/verilog-multiplexer-2x1/
//adapted by sophie watson
//19/01/23

module Mux21 (

 input a, 
 input b, 
 input sel,
 output out

);
//(a,b,sel,out)


	wire T1;
	wire T2;
	wire Sbar;

	and (T1, b, sel), (T2, a, Sbar);
	not (Sbar, sel);
	or (out, T1, T2);

endmodule
