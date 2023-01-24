//Sophie Watson
//22/1/23
//Mux20thro8Way
//20 bit 8 option mux - built by combining mux20thros together

module Mux20thro8way(

 input [19:0] A,
 input [19:0] B,
 input [19:0] C,
 input [19:0] D,
 input [19:0] E,
 input [19:0] F,
 input [19:0] G,
 input [19:0] H,
 input [2:0] sel,
 output wire [19:0] OUT

); 

wire [19:0] x;
wire [19:0] y;
wire [19:0] z;
wire [19:0] w;
wire [19:0] q;
wire [19:0] r;

    Mux20thro mux200(A, B, sel[0], x);
    Mux20thro mux201(C, D, sel[0], y);
    
    Mux20thro mux202(E, F, sel[0], w);
    Mux20thro mux203(G, H, sel[0], z);

    Mux20thro mux204(x, y, sel[1], q);
    Mux20thro mux205(w, z, sel[1], r);

    Mux20thro mux206(q, r, sel[2], OUT);
	 

endmodule
