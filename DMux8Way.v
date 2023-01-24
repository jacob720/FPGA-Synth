//DMux8Way
//adapted by sophie watson from nand2tetris
//23/01/23

module DMux8Way (

  input IN,
  input [2:0] sel,
  output wire a,
  output wire b,
  output wire c,
  output wire d,
  output wire e,
  output wire f,
  output wire g,
  output wire h

);


 wire u;
 wire v;
 wire w;
 wire x;
 wire y;
 wire z;

    DMux21 dmux0(IN, sel[2], u, v);
    DMux21 dmux1(u,  sel[1], x, y);
    DMux21 dmux2(v,  sel[1], z, w);
    DMux21 dmux3(x,  sel[0], a, b);
    DMux21 dmux4(y,  sel[0], c, d);
    DMux21 dmux5(z,  sel[0], e, f);
    DMux21 dmux6(w,  sel[0], g, h);
	 
endmodule
