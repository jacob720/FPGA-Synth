module Release(
	input clk,
	input clk_r,
	input start,
	input [4:0]sustain_level,
	input [19:0]in,
	output reg [19:0] out,
	output end_release
);


wire [4:0]scalar;
wire [4:0]compare_scalar;

IncreasingScalar scalar_inc(
	clk_r,
	start,
	sustain_level,
	scalar
);

and(compare_scalar[0],scalar[0],1'b1);//when scalar at end amount+1 so for other version it will be 20
xnor(compare_scalar[1],scalar[1],1'b0);
and(compare_scalar[2],scalar[2],1'b1);
xnor(compare_scalar[3],scalar[3],1'b0);
and(compare_scalar[4],scalar[4],1'b1);
and(end_release,compare_scalar[0],compare_scalar[1],compare_scalar[2],compare_scalar[3],compare_scalar[4]);

	always @ (posedge clk) begin
	
		out <= in >> scalar;
		
	end
	
endmodule