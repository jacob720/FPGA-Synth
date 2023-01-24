module DEMUX_24out(
	input clk,
	input [7:0]in,
	input [4:0]sel,
	output reg [7:0]out0,
	output reg [7:0]out1,
	output reg [7:0]out2,
	output reg [7:0]out3,
	output reg [7:0]out4,
	output reg [7:0]out5,
	output reg [7:0]out6,
	output reg [7:0]out7,
	output reg [7:0]out8,
	output reg [7:0]out9,
	output reg [7:0]out10,
	output reg [7:0]out11,
	output reg [7:0]out12,
	output reg [7:0]out13,
	output reg [7:0]out14,
	output reg [7:0]out15,
	output reg [7:0]out16,
	output reg [7:0]out17,
	output reg [7:0]out18,
	output reg [7:0]out19,
	output reg [7:0]out20,
	output reg [7:0]out21,
	output reg [7:0]out22,
	output reg [7:0]out23
);

	//always @ (in or sel) begin
	always @ (posedge clk) begin
	
	case(sel)
		5'b00000: out0 <= in;
		5'b00001: out1 <= in;
		5'b00010: out2 <= in;
		5'b00011: out3 <= in;
		5'b00100: out4 <= in;
		5'b00101: out5 <= in;
		5'b00110: out6 <= in;
		5'b00111: out7 <= in;
		5'b01000: out8 <= in;
		5'b01001: out9 <= in;
		5'b01010: out10 <= in;
		5'b01011: out11 <= in;
		5'b01100: out12 <= in;
		5'b01101: out13 <= in;
		5'b01110: out14 <= in;
		5'b01111: out15 <= in;
		5'b10000: out16 <= in;
		5'b10001: out17 <= in;
		5'b10010: out18 <= in;
		5'b10011: out19 <= in;
		5'b10100: out20 <= in;
		5'b10101: out21 <= in;
		5'b10110: out22 <= in;
		5'b10111: out23 <= in;
		default: begin
			out0 <= 8'b0;
			out1 <= 8'b0;
			out2 <= 8'b0;
			out3 <= 8'b0;
			out4 <= 8'b0;
			out5 <= 8'b0;
			out6 <= 8'b0;
			out7 <= 8'b0;
			out8 <= 8'b0;
			out9 <= 8'b0;
			out10 <= 8'b0;
			out11 <= 8'b0;
			out12 <= 8'b0;
			out13 <= 8'b0;
			out14 <= 8'b0;
			out15 <= 8'b0;
			out16 <= 8'b0;
			out17 <= 8'b0;
			out18 <= 8'b0;
			out19 <= 8'b0;
			out20 <= 8'b0;
			out21 <= 8'b0;
			out22 <= 8'b0;
			out23 <= 8'b0;
		end
	
	endcase
	
	end
	
endmodule