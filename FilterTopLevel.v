module FilterTopLevel(
	input clk,
	input [19:0] in,
	input reset,
	input [1:0] filter_select, // 0 no 1 low
	input [1:0] cutoff_select,
	output reg [19:0] out
);

wire [39:0] lpf_out;
wire [39:0] hpf_out;
wire [39:0] mux0_out;
wire [39:0] mux1_out;

reg [15:0] h0_lpf;
reg [15:0] h1_lpf;
reg [15:0] h2_lpf;
reg [15:0] h3_lpf;
reg [15:0] h4_lpf;
reg [15:0] h5_lpf;
reg [15:0] h6_lpf;
reg [15:0] h7_lpf;
reg [15:0] h8_lpf;
reg [15:0] h9_lpf;
reg [15:0] h10_lpf;
reg [15:0] h11_lpf;
reg [15:0] h12_lpf;
reg [15:0] h13_lpf;
reg [15:0] h14_lpf;
reg [15:0] h15_lpf;
reg [15:0] h16_lpf;
reg [15:0] h17_lpf;
reg [15:0] h18_lpf;
reg [15:0] h19_lpf;
reg [15:0] h20_lpf;
reg [15:0] h21_lpf;
reg [15:0] h22_lpf;
reg [15:0] h23_lpf;
reg [15:0] h24_lpf;
reg [15:0] h25_lpf;
reg [15:0] h26_lpf;
reg [15:0] h27_lpf;
reg [15:0] h28_lpf;
reg [15:0] h29_lpf;
reg [15:0] h30_lpf;
reg [15:0] h31_lpf;
reg [15:0] h32_lpf;
reg [15:0] h33_lpf;
reg [15:0] h34_lpf;
reg [15:0] h35_lpf;
reg [15:0] h36_lpf;
reg [15:0] h37_lpf;
reg [15:0] h38_lpf;
reg [15:0] h39_lpf;
reg [15:0] h40_lpf;
reg [15:0] h41_lpf;
reg [15:0] h42_lpf;
reg [15:0] h43_lpf;
reg [15:0] h44_lpf;
reg [15:0] h45_lpf;
reg [15:0] h46_lpf;
reg [15:0] h47_lpf;
reg [15:0] h48_lpf;
reg [15:0] h49_lpf;
reg [15:0] h50_lpf;
reg [15:0] h51_lpf;
reg [15:0] h52_lpf;
reg [15:0] h53_lpf;
reg [15:0] h54_lpf;
reg [15:0] h55_lpf;
reg [15:0] h56_lpf;
reg [15:0] h57_lpf;
reg [15:0] h58_lpf;
reg [15:0] h59_lpf;
reg [15:0] h60_lpf;
reg [15:0] h61_lpf;
reg [15:0] h62_lpf;
reg [15:0] h63_lpf;
reg [15:0] h64_lpf;
reg [15:0] h65_lpf;
reg [15:0] h66_lpf;
reg [15:0] h67_lpf;
reg [15:0] h68_lpf;
reg [15:0] h69_lpf;
reg [15:0] h70_lpf;
reg [15:0] h71_lpf;
reg [15:0] h72_lpf;
reg [15:0] h73_lpf;
reg [15:0] h74_lpf;
reg [15:0] h75_lpf;
reg [15:0] h76_lpf;
reg [15:0] h77_lpf;
reg [15:0] h78_lpf;
reg [15:0] h79_lpf;
reg [15:0] h80_lpf;

reg [15:0] h0_hpf;
reg [15:0] h1_hpf;
reg [15:0] h2_hpf;
reg [15:0] h3_hpf;
reg [15:0] h4_hpf;
reg [15:0] h5_hpf;
reg [15:0] h6_hpf;
reg [15:0] h7_hpf;
reg [15:0] h8_hpf;
reg [15:0] h9_hpf;
reg [15:0] h10_hpf;
reg [15:0] h11_hpf;
reg [15:0] h12_hpf;
reg [15:0] h13_hpf;
reg [15:0] h14_hpf;
reg [15:0] h15_hpf;
reg [15:0] h16_hpf;
reg [15:0] h17_hpf;
reg [15:0] h18_hpf;
reg [15:0] h19_hpf;
reg [15:0] h20_hpf;
reg [15:0] h21_hpf;
reg [15:0] h22_hpf;
reg [15:0] h23_hpf;
reg [15:0] h24_hpf;
reg [15:0] h25_hpf;
reg [15:0] h26_hpf;
reg [15:0] h27_hpf;
reg [15:0] h28_hpf;
reg [15:0] h29_hpf;
reg [15:0] h30_hpf;
reg [15:0] h31_hpf;
reg [15:0] h32_hpf;
reg [15:0] h33_hpf;
reg [15:0] h34_hpf;
reg [15:0] h35_hpf;
reg [15:0] h36_hpf;
reg [15:0] h37_hpf;
reg [15:0] h38_hpf;
reg [15:0] h39_hpf;
reg [15:0] h40_hpf;
reg [15:0] h41_hpf;
reg [15:0] h42_hpf;
reg [15:0] h43_hpf;
reg [15:0] h44_hpf;
reg [15:0] h45_hpf;
reg [15:0] h46_hpf;
reg [15:0] h47_hpf;
reg [15:0] h48_hpf;
reg [15:0] h49_hpf;
reg [15:0] h50_hpf;
reg [15:0] h51_hpf;
reg [15:0] h52_hpf;
reg [15:0] h53_hpf;
reg [15:0] h54_hpf;
reg [15:0] h55_hpf;
reg [15:0] h56_hpf;
reg [15:0] h57_hpf;
reg [15:0] h58_hpf;
reg [15:0] h59_hpf;
reg [15:0] h60_hpf;
reg [15:0] h61_hpf;
reg [15:0] h62_hpf;
reg [15:0] h63_hpf;
reg [15:0] h64_hpf;
reg [15:0] h65_hpf;
reg [15:0] h66_hpf;
reg [15:0] h67_hpf;
reg [15:0] h68_hpf;
reg [15:0] h69_hpf;
reg [15:0] h70_hpf;
reg [15:0] h71_hpf;
reg [15:0] h72_hpf;
reg [15:0] h73_hpf;
reg [15:0] h74_hpf;
reg [15:0] h75_hpf;
reg [15:0] h76_hpf;
reg [15:0] h77_hpf;
reg [15:0] h78_hpf;
reg [15:0] h79_hpf;
reg [15:0] h80_hpf;

Filter_161Tap lpf(
	clk,
	{20'b0,in},
	h0_lpf,
	h1_lpf,
	h2_lpf,
	h3_lpf,
	h4_lpf,
	h5_lpf,
	h6_lpf,
	h7_lpf,
	h8_lpf,
	h9_lpf,
	h10_lpf,
	h11_lpf,
	h12_lpf,
	h13_lpf,
	h14_lpf,
	h15_lpf,
	h16_lpf,
	h17_lpf,
	h18_lpf,
	h19_lpf,
	h20_lpf,
	h21_lpf,
	h22_lpf,
	h23_lpf,
	h24_lpf,
	h25_lpf,
	h26_lpf,
	h27_lpf,
	h28_lpf,
	h29_lpf,
	h30_lpf,
	h31_lpf,
	h32_lpf,
	h33_lpf,
	h34_lpf,
	h35_lpf,
	h36_lpf,
	h37_lpf,
	h38_lpf,
	h39_lpf,
	h40_lpf,
	h41_lpf,
	h42_lpf,
	h43_lpf,
	h44_lpf,
	h45_lpf,
	h46_lpf,
	h47_lpf,
	h48_lpf,
	h49_lpf,
	h50_lpf,
	h51_lpf,
	h52_lpf,
	h53_lpf,
	h54_lpf,
	h55_lpf,
	h56_lpf,
	h57_lpf,
	h58_lpf,
	h59_lpf,
	h60_lpf,
	h61_lpf,
	h62_lpf,
	h63_lpf,
	h64_lpf,
	h65_lpf,
	h66_lpf,
	h67_lpf,
	h68_lpf,
	h69_lpf,
	h70_lpf,
	h71_lpf,
	h72_lpf,
	h73_lpf,
	h74_lpf,
	h75_lpf,
	h76_lpf,
	h77_lpf,
	h78_lpf,
	h79_lpf,
	h80_lpf,
	lpf_out
);

//Multiplexer20bit mux0(
//	in,
//	lpf_out,
//	filter_select[0],
//	mux0_out
//);

Multiplexer40bit mux0(
	{20'b0,in},
	lpf_out,
	filter_select[0],
	mux0_out
);

Filter_161Tap hpf(
	clk,
	mux0_out,
	h0_hpf,
	h1_hpf,
	h2_hpf,
	h3_hpf,
	h4_hpf,
	h5_hpf,
	h6_hpf,
	h7_hpf,
	h8_hpf,
	h9_hpf,
	h10_hpf,
	h11_hpf,
	h12_hpf,
	h13_hpf,
	h14_hpf,
	h15_hpf,
	h16_hpf,
	h17_hpf,
	h18_hpf,
	h19_hpf,
	h20_hpf,
	h21_hpf,
	h22_hpf,
	h23_hpf,
	h24_hpf,
	h25_hpf,
	h26_hpf,
	h27_hpf,
	h28_hpf,
	h29_hpf,
	h30_hpf,
	h31_hpf,
	h32_hpf,
	h33_hpf,
	h34_hpf,
	h35_hpf,
	h36_hpf,
	h37_hpf,
	h38_hpf,
	h39_hpf,
	h40_hpf,
	h41_hpf,
	h42_hpf,
	h43_hpf,
	h44_hpf,
	h45_hpf,
	h46_hpf,
	h47_hpf,
	h48_hpf,
	h49_hpf,
	h50_hpf,
	h51_hpf,
	h52_hpf,
	h53_hpf,
	h54_hpf,
	h55_hpf,
	h56_hpf,
	h57_hpf,
	h58_hpf,
	h59_hpf,
	h60_hpf,
	h61_hpf,
	h62_hpf,
	h63_hpf,
	h64_hpf,
	h65_hpf,
	h66_hpf,
	h67_hpf,
	h68_hpf,
	h69_hpf,
	h70_hpf,
	h71_hpf,
	h72_hpf,
	h73_hpf,
	h74_hpf,
	h75_hpf,
	h76_hpf,
	h77_hpf,
	h78_hpf,
	h79_hpf,
	h80_hpf,
	hpf_out
);

//Multiplexer20bit mux1(
//	in,
//	hpf_out,
//	filter_select[1],
//	out
//);

Multiplexer40bit mux1(
	mux0_out,
	hpf_out,
	filter_select[1],
	mux1_out
);

always @ (filter_select, cutoff_select, clk) begin
	if (filter_select == 2'b01 && (cutoff_select == 2'b00||cutoff_select == 2'b11)) begin
		out <= mux1_out[34:15];
	end else if (filter_select == 2'b00) begin
		out <= mux1_out[19:0];
	end else begin
		out <= mux1_out[39:20];
	end
end

always @ (cutoff_select or reset or clk) begin
	if (reset) begin
		h0_lpf <= 16'b0;
		h1_lpf <= 16'b0;
		h2_lpf <= 16'b0;
		h3_lpf <= 16'b0;
		h4_lpf <= 16'b0;
		h5_lpf <= 16'b0;
		h6_lpf <= 16'b0;
		h7_lpf <= 16'b0;
		h8_lpf <= 16'b0;
		h9_lpf <= 16'b0;
		h10_lpf <= 16'b0;
		h11_lpf <= 16'b0;
		h12_lpf <= 16'b0;
		h13_lpf <= 16'b0;
		h14_lpf <= 16'b0;
		h15_lpf <= 16'b0;
		h16_lpf <= 16'b0;
		h17_lpf <= 16'b0;
		h18_lpf <= 16'b0;
		h19_lpf <= 16'b0;
		h20_lpf <= 16'b0;
		h21_lpf <= 16'b0;
		h22_lpf <= 16'b0;
		h23_lpf <= 16'b0;
		h24_lpf <= 16'b0;
		h25_lpf <= 16'b0;
		h26_lpf <= 16'b0;
		h27_lpf <= 16'b0;
		h28_lpf <= 16'b0;
		h29_lpf <= 16'b0;
		h30_lpf <= 16'b0;
		h31_lpf <= 16'b0;
		h32_lpf <= 16'b0;
		h33_lpf <= 16'b0;
		h34_lpf <= 16'b0;
		h35_lpf <= 16'b0;
		h36_lpf <= 16'b0;
		h37_lpf <= 16'b0;
		h38_lpf <= 16'b0;
		h39_lpf <= 16'b0;
		h40_lpf <= 16'b0;
		h41_lpf <= 16'b0;
		h42_lpf <= 16'b0;
		h43_lpf <= 16'b0;
		h44_lpf <= 16'b0;
		h45_lpf <= 16'b0;
		h46_lpf <= 16'b0;
		h47_lpf <= 16'b0;
		h48_lpf <= 16'b0;
		h49_lpf <= 16'b0;
		h50_lpf <= 16'b0;
		h51_lpf <= 16'b0;
		h52_lpf <= 16'b0;
		h53_lpf <= 16'b0;
		h54_lpf <= 16'b0;
		h55_lpf <= 16'b0;
		h56_lpf <= 16'b0;
		h57_lpf <= 16'b0;
		h58_lpf <= 16'b0;
		h59_lpf <= 16'b0;
		h60_lpf <= 16'b0;
		h61_lpf <= 16'b0;
		h62_lpf <= 16'b0;
		h63_lpf <= 16'b0;
		h64_lpf <= 16'b0;
		h65_lpf <= 16'b0;
		h66_lpf <= 16'b0;
		h67_lpf <= 16'b0;
		h68_lpf <= 16'b0;
		h69_lpf <= 16'b0;
		h70_lpf <= 16'b0;
		h71_lpf <= 16'b0;
		h72_lpf <= 16'b0;
		h73_lpf <= 16'b0;
		h74_lpf <= 16'b0;
		h75_lpf <= 16'b0;
		h76_lpf <= 16'b0;
		h77_lpf <= 16'b0;
		h78_lpf <= 16'b0;
		h79_lpf <= 16'b0;
		h80_lpf <= 16'b0;

		h0_hpf <= 16'b0;
		h1_hpf <= 16'b0;
		h2_hpf <= 16'b0;
		h3_hpf <= 16'b0;
		h4_hpf <= 16'b0;
		h5_hpf <= 16'b0;
		h6_hpf <= 16'b0;
		h7_hpf <= 16'b0;
		h8_hpf <= 16'b0;
		h9_hpf <= 16'b0;
		h10_hpf <= 16'b0;
		h11_hpf <= 16'b0;
		h12_hpf <= 16'b0;
		h13_hpf <= 16'b0;
		h14_hpf <= 16'b0;
		h15_hpf <= 16'b0;
		h16_hpf <= 16'b0;
		h17_hpf <= 16'b0;
		h18_hpf <= 16'b0;
		h19_hpf <= 16'b0;
		h20_hpf <= 16'b0;
		h21_hpf <= 16'b0;
		h22_hpf <= 16'b0;
		h23_hpf <= 16'b0;
		h24_hpf <= 16'b0;
		h25_hpf <= 16'b0;
		h26_hpf <= 16'b0;
		h27_hpf <= 16'b0;
		h28_hpf <= 16'b0;
		h29_hpf <= 16'b0;
		h30_hpf <= 16'b0;
		h31_hpf <= 16'b0;
		h32_hpf <= 16'b0;
		h33_hpf <= 16'b0;
		h34_hpf <= 16'b0;
		h35_hpf <= 16'b0;
		h36_hpf <= 16'b0;
		h37_hpf <= 16'b0;
		h38_hpf <= 16'b0;
		h39_hpf <= 16'b0;
		h40_hpf <= 16'b0;
		h41_hpf <= 16'b0;
		h42_hpf <= 16'b0;
		h43_hpf <= 16'b0;
		h44_hpf <= 16'b0;
		h45_hpf <= 16'b0;
		h46_hpf <= 16'b0;
		h47_hpf <= 16'b0;
		h48_hpf <= 16'b0;
		h49_hpf <= 16'b0;
		h50_hpf <= 16'b0;
		h51_hpf <= 16'b0;
		h52_hpf <= 16'b0;
		h53_hpf <= 16'b0;
		h54_hpf <= 16'b0;
		h55_hpf <= 16'b0;
		h56_hpf <= 16'b0;
		h57_hpf <= 16'b0;
		h58_hpf <= 16'b0;
		h59_hpf <= 16'b0;
		h60_hpf <= 16'b0;
		h61_hpf <= 16'b0;
		h62_hpf <= 16'b0;
		h63_hpf <= 16'b0;
		h64_hpf <= 16'b0;
		h65_hpf <= 16'b0;
		h66_hpf <= 16'b0;
		h67_hpf <= 16'b0;
		h68_hpf <= 16'b0;
		h69_hpf <= 16'b0;
		h70_hpf <= 16'b0;
		h71_hpf <= 16'b0;
		h72_hpf <= 16'b0;
		h73_hpf <= 16'b0;
		h74_hpf <= 16'b0;
		h75_hpf <= 16'b0;
		h76_hpf <= 16'b0;
		h77_hpf <= 16'b0;
		h78_hpf <= 16'b0;
		h79_hpf <= 16'b0;
		h80_hpf <= 16'b0;
	end else begin
		if (cutoff_select == 2'b00 || cutoff_select == 2'b11) begin // 300hz lpf 1000 hpf
		h0_lpf = 16'sd548;
		h1_lpf <= 16'sd60;
		h2_lpf <= 16'sd63;
		h3_lpf <= 16'sd67;
		h4_lpf <= 16'sd70;
		h5_lpf <= 16'sd74;
		h6_lpf <= 16'sd77;
		h7_lpf <= 16'sd81;
		h8_lpf <= 16'sd84;
		h9_lpf <= 16'sd88;
		h10_lpf <= 16'sd92;
		h11_lpf <= 16'sd96;
		h12_lpf <= 16'sd99;
		h13_lpf <= 16'sd103;
		h14_lpf <= 16'sd107;
		h15_lpf <= 16'sd111;
		h16_lpf <= 16'sd115;
		h17_lpf <= 16'sd120;
		h18_lpf <= 16'sd124;
		h19_lpf <= 16'sd128;
		h20_lpf <= 16'sd132;
		h21_lpf <= 16'sd137;
		h22_lpf <= 16'sd141;
		h23_lpf <= 16'sd145;
		h24_lpf <= 16'sd150;
		h25_lpf <= 16'sd154;
		h26_lpf <= 16'sd158;
		h27_lpf <= 16'sd163;
		h28_lpf <= 16'sd167;
		h29_lpf <= 16'sd171;
		h30_lpf <= 16'sd176;
		h31_lpf <= 16'sd180;
		h32_lpf <= 16'sd184;
		h33_lpf <= 16'sd189;
		h34_lpf <= 16'sd193;
		h35_lpf <= 16'sd198;
		h36_lpf <= 16'sd202;
		h37_lpf <= 16'sd206;
		h38_lpf <= 16'sd210;
		h39_lpf <= 16'sd214;
		h40_lpf <= 16'sd218;
		h41_lpf <= 16'sd223;
		h42_lpf <= 16'sd227;
		h43_lpf <= 16'sd232;
		h44_lpf <= 16'sd234;
		h45_lpf <= 16'sd239;
		h46_lpf <= 16'sd243;
		h47_lpf <= 16'sd247;
		h48_lpf <= 16'sd250;
		h49_lpf <= 16'sd254;
		h50_lpf <= 16'sd258;
		h51_lpf <= 16'sd261;
		h52_lpf <= 16'sd264;
		h53_lpf <= 16'sd268;
		h54_lpf <= 16'sd271;
		h55_lpf <= 16'sd274;
		h56_lpf <= 16'sd277;
		h57_lpf <= 16'sd280;
		h58_lpf <= 16'sd283;
		h59_lpf <= 16'sd286;
		h60_lpf <= 16'sd288;
		h61_lpf <= 16'sd291;
		h62_lpf <= 16'sd293;
		h63_lpf <= 16'sd296;
		h64_lpf <= 16'sd298;
		h65_lpf <= 16'sd300;
		h66_lpf <= 16'sd302;
		h67_lpf <= 16'sd304;
		h68_lpf <= 16'sd305;
		h69_lpf <= 16'sd307;
		h70_lpf <= 16'sd308;
		h71_lpf <= 16'sd310;
		h72_lpf <= 16'sd311;
		h73_lpf <= 16'sd312;
		h74_lpf <= 16'sd313;
		h75_lpf <= 16'sd313;
		h76_lpf <= 16'sd314;
		h77_lpf <= 16'sd314;
		h78_lpf <= 16'sd315;
		h79_lpf <= 16'sd315;
		h80_lpf <= 16'sd315;
		
		h0_hpf <= -16'sd555;
		h1_hpf <= -16'sd288;
		h2_hpf <= -16'sd480;
		h3_hpf <= -16'sd708;
		h4_hpf <= -16'sd970;
		h5_hpf <= -16'sd1254;
		h6_hpf <= -16'sd1575;
		h7_hpf <= -16'sd1912;
		h8_hpf <= -16'sd2259;
		h9_hpf <= -16'sd2620;
		h10_hpf <= -16'sd2981;
		h11_hpf <= -16'sd3336;
		h12_hpf <= -16'sd3679;
		h13_hpf <= -16'sd3990;
		h14_hpf <= -16'sd4260;
		h15_hpf <= -16'sd4480;
		h16_hpf <= -16'sd4641;
		h17_hpf <= -16'sd4734;
		h18_hpf <= -16'sd4731;
		h19_hpf <= -16'sd4640;
		h20_hpf <= -16'sd4431;
		h21_hpf <= -16'sd4114;
		h22_hpf <= -16'sd3657;
		h23_hpf <= -16'sd3096;
		h24_hpf <= -16'sd2375;
		h25_hpf <= -16'sd1508;
		h26_hpf <= -16'sd486;
		h27_hpf <= 16'sd672;
		h28_hpf <= 16'sd1972;
		h29_hpf <= 16'sd3420;
		h30_hpf <= 16'sd5022;
		h31_hpf <= 16'sd6720;
		h32_hpf <= 16'sd8547;
		h33_hpf <= 16'sd10438;
		h34_hpf <= 16'sd12425;
		h35_hpf <= 16'sd14436;
		h36_hpf <= 16'sd16502;
		h37_hpf <= 16'sd18582;
		h38_hpf <= 16'sd20631;
		h39_hpf <= 16'sd22600;
		h40_hpf <= 16'sd24518;
		h41_hpf <= 16'sd26292;
		h42_hpf <= 16'sd27950;
		h43_hpf <= 16'sd29392;
		h44_hpf <= 16'sd30600;
		h45_hpf <= 16'sd31602;
		h46_hpf <= 16'sd32289;
		h47_hpf <= 16'sd32688;
		h48_hpf <= 16'sd32732;
		h49_hpf <= 16'sd32400;
		h50_hpf <= 16'sd31671;
		h51_hpf <= 16'sd30524;
		h52_hpf <= 16'sd28991;
		h53_hpf <= 16'sd27000;
		h54_hpf <= 16'sd24585;
		h55_hpf <= 16'sd21728;
		h56_hpf <= 16'sd18411;
		h57_hpf <= 16'sd14674;
		h58_hpf <= 16'sd10561;
		h59_hpf <= 16'sd6000;
		h60_hpf <= 16'sd1098;
		h61_hpf <= -16'sd4154;
		h62_hpf <= -16'sd9702;
		h63_hpf <= -16'sd15488;
		h64_hpf <= -16'sd21515;
		h65_hpf <= -16'sd27654;
		h66_hpf <= -16'sd33969;
		h67_hpf <= -16'sd40324;
		h68_hpf <= -16'sd46644;
		h69_hpf <= -16'sd52920;
		h70_hpf <= -16'sd59001;
		h71_hpf <= -16'sd64944;
		h72_hpf <= -16'sd70591;
		h73_hpf <= -16'sd75998;
		h74_hpf <= -16'sd80925;
		h75_hpf <= -16'sd85424;
		h76_hpf <= -16'sd89474;
		h77_hpf <= -16'sd92976;
		h78_hpf <= -16'sd95827;
		h79_hpf <= -16'sd98080;
		h80_hpf <= -16'sd99711;
		end
		if (cutoff_select == 2'b01) begin // lpf 600 hpf 300
			h0_lpf <= -16'sd546;
			h1_lpf <= -16'sd67;
			h2_lpf <= -16'sd71;
			h3_lpf <= -16'sd74;
			h4_lpf <= -16'sd78;
			h5_lpf <= -16'sd81;
			h6_lpf <= -16'sd83;
			h7_lpf <= -16'sd85;
			h8_lpf <= -16'sd87;
			h9_lpf <= -16'sd89;
			h10_lpf <= -16'sd89;
			h11_lpf <= -16'sd90;
			h12_lpf <= -16'sd89;
			h13_lpf <= -16'sd89;
			h14_lpf <= -16'sd87;
			h15_lpf <= -16'sd85;
			h16_lpf <= -16'sd82;
			h17_lpf <= -16'sd78;
			h18_lpf <= -16'sd74;
			h19_lpf <= -16'sd69;
			h20_lpf <= -16'sd63;
			h21_lpf <= -16'sd56;
			h22_lpf <= -16'sd48;
			h23_lpf <= -16'sd40;
			h24_lpf <= -16'sd31;
			h25_lpf <= -16'sd20;
			h26_lpf <= -16'sd9;
			h27_lpf <= 16'sd3;
			h28_lpf <= 16'sd17;
			h29_lpf <= 16'sd31;
			h30_lpf <= 16'sd46;
			h31_lpf <= 16'sd62;
			h32_lpf <= 16'sd79;
			h33_lpf <= 16'sd97;
			h34_lpf <= 16'sd116;
			h35_lpf <= 16'sd135;
			h36_lpf <= 16'sd156;
			h37_lpf <= 16'sd177;
			h38_lpf <= 16'sd199;
			h39_lpf <= 16'sd222;
			h40_lpf <= 16'sd246;
			h41_lpf <= 16'sd270;
			h42_lpf <= 16'sd295;
			h43_lpf <= 16'sd320;
			h44_lpf <= 16'sd347;
			h45_lpf <= 16'sd373;
			h46_lpf <= 16'sd400;
			h47_lpf <= 16'sd427;
			h48_lpf <= 16'sd454;
			h49_lpf <= 16'sd482;
			h50_lpf <= 16'sd509;
			h51_lpf <= 16'sd537;
			h52_lpf <= 16'sd565;
			h53_lpf <= 16'sd593;
			h54_lpf <= 16'sd620;
			h55_lpf <= 16'sd648;
			h56_lpf <= 16'sd674;
			h57_lpf <= 16'sd701;
			h58_lpf <= 16'sd727;
			h59_lpf <= 16'sd753;
			h60_lpf <= 16'sd778;
			h61_lpf <= 16'sd802;
			h62_lpf <= 16'sd826;
			h63_lpf <= 16'sd848;
			h64_lpf <= 16'sd870;
			h65_lpf <= 16'sd891;
			h66_lpf <= 16'sd911;
			h67_lpf <= 16'sd930;
			h68_lpf <= 16'sd947;
			h69_lpf <= 16'sd964;
			h70_lpf <= 16'sd979;
			h71_lpf <= 16'sd993;
			h72_lpf <= 16'sd1005;
			h73_lpf <= 16'sd1017;
			h74_lpf <= 16'sd1026;
			h75_lpf <= 16'sd1035;
			h76_lpf <= 16'sd1041;
			h77_lpf <= 16'sd1047;
			h78_lpf <= 16'sd1051;
			h79_lpf <= 16'sd1053;
			h80_lpf <= 16'sd1054;
			
			h0_hpf <= -16'sd548;
			h1_hpf <= -16'sd120;
			h2_hpf <= -16'sd189;
			h3_hpf <= -16'sd268;
			h4_hpf <= -16'sd350;
			h5_hpf <= -16'sd444;
			h6_hpf <= -16'sd539;
			h7_hpf <= -16'sd648;
			h8_hpf <= -16'sd756;
			h9_hpf <= -16'sd880;
			h10_hpf <= -16'sd1012;
			h11_hpf <= -16'sd1152;
			h12_hpf <= -16'sd1287;
			h13_hpf <= -16'sd1442;
			h14_hpf <= -16'sd1605;
			h15_hpf <= -16'sd1776;
			h16_hpf <= -16'sd1955;
			h17_hpf <= -16'sd2160;
			h18_hpf <= -16'sd2356;
			h19_hpf <= -16'sd2560;
			h20_hpf <= -16'sd2772;
			h21_hpf <= -16'sd3014;
			h22_hpf <= -16'sd3243;
			h23_hpf <= -16'sd3480;
			h24_hpf <= -16'sd3750;
			h25_hpf <= -16'sd4004;
			h26_hpf <= -16'sd4266;
			h27_hpf <= -16'sd4564;
			h28_hpf <= -16'sd4843;
			h29_hpf <= -16'sd5130;
			h30_hpf <= -16'sd5456;
			h31_hpf <= -16'sd5760;
			h32_hpf <= -16'sd6072;
			h33_hpf <= -16'sd6426;
			h34_hpf <= -16'sd6755;
			h35_hpf <= -16'sd7128;
			h36_hpf <= -16'sd7474;
			h37_hpf <= -16'sd7828;
			h38_hpf <= -16'sd8190;
			h39_hpf <= -16'sd8560;
			h40_hpf <= -16'sd8938;
			h41_hpf <= -16'sd9366;
			h42_hpf <= -16'sd9761;
			h43_hpf <= -16'sd10208;
			h44_hpf <= -16'sd10530;
			h45_hpf <= -16'sd10994;
			h46_hpf <= -16'sd11421;
			h47_hpf <= -16'sd11856;
			h48_hpf <= -16'sd12250;
			h49_hpf <= -16'sd12700;
			h50_hpf <= -16'sd13158;
			h51_hpf <= -16'sd13572;
			h52_hpf <= -16'sd13992;
			h53_hpf <= -16'sd14472;
			h54_hpf <= -16'sd14905;
			h55_hpf <= -16'sd15344;
			h56_hpf <= -16'sd15789;
			h57_hpf <= -16'sd16240;
			h58_hpf <= -16'sd16697;
			h59_hpf <= -16'sd17160;
			h60_hpf <= -16'sd17568;
			h61_hpf <= -16'sd18042;
			h62_hpf <= -16'sd18459;
			h63_hpf <= -16'sd18944;
			h64_hpf <= -16'sd19370;
			h65_hpf <= -16'sd19800;
			h66_hpf <= -16'sd20234;
			h67_hpf <= -16'sd20672;
			h68_hpf <= -16'sd21045;
			h69_hpf <= -16'sd21490;
			h70_hpf <= -16'sd21868;
			h71_hpf <= -16'sd22320;
			h72_hpf <= -16'sd22703;
			h73_hpf <= -16'sd23088;
			h74_hpf <= -16'sd23475;
			h75_hpf <= -16'sd23788;
			h76_hpf <= -16'sd24178;
			h77_hpf <= -16'sd24492;
			h78_hpf <= -16'sd24885;
			h79_hpf <= -16'sd25200;
			h80_hpf <= -16'sd25515;
		end
		if (cutoff_select == 2'b10) begin // lpf 1000 hpf 600
			h0_lpf <= 16'sd555;
			h1_lpf <= 16'sd144;
			h2_lpf <= 16'sd160;
			h3_lpf <= 16'sd177;
			h4_lpf <= 16'sd194;
			h5_lpf <= 16'sd209;
			h6_lpf <= 16'sd225;
			h7_lpf <= 16'sd239;
			h8_lpf <= 16'sd251;
			h9_lpf <= 16'sd262;
			h10_lpf <= 16'sd271;
			h11_lpf <= 16'sd278;
			h12_lpf <= 16'sd283;
			h13_lpf <= 16'sd285;
			h14_lpf <= 16'sd284;
			h15_lpf <= 16'sd280;
			h16_lpf <= 16'sd273;
			h17_lpf <= 16'sd263;
			h18_lpf <= 16'sd249;
			h19_lpf <= 16'sd232;
			h20_lpf <= 16'sd211;
			h21_lpf <= 16'sd187;
			h22_lpf <= 16'sd159;
			h23_lpf <= 16'sd129;
			h24_lpf <= 16'sd95;
			h25_lpf <= 16'sd58;
			h26_lpf <= 16'sd18;
			h27_lpf <= -16'sd24;
			h28_lpf <= -16'sd68;
			h29_lpf <= -16'sd114;
			h30_lpf <= -16'sd162;
			h31_lpf <= -16'sd210;
			h32_lpf <= -16'sd259;
			h33_lpf <= -16'sd307;
			h34_lpf <= -16'sd355;
			h35_lpf <= -16'sd401;
			h36_lpf <= -16'sd446;
			h37_lpf <= -16'sd489;
			h38_lpf <= -16'sd529;
			h39_lpf <= -16'sd565;
			h40_lpf <= -16'sd598;
			h41_lpf <= -16'sd626;
			h42_lpf <= -16'sd650;
			h43_lpf <= -16'sd668;
			h44_lpf <= -16'sd680;
			h45_lpf <= -16'sd687;
			h46_lpf <= -16'sd687;
			h47_lpf <= -16'sd681;
			h48_lpf <= -16'sd668;
			h49_lpf <= -16'sd648;
			h50_lpf <= -16'sd621;
			h51_lpf <= -16'sd587;
			h52_lpf <= -16'sd547;
			h53_lpf <= -16'sd500;
			h54_lpf <= -16'sd447;
			h55_lpf <= -16'sd388;
			h56_lpf <= -16'sd323;
			h57_lpf <= -16'sd253;
			h58_lpf <= -16'sd179;
			h59_lpf <= -16'sd100;
			h60_lpf <= -16'sd18;
			h61_lpf <= 16'sd67;
			h62_lpf <= 16'sd154;
			h63_lpf <= 16'sd242;
			h64_lpf <= 16'sd331;
			h65_lpf <= 16'sd419;
			h66_lpf <= 16'sd507;
			h67_lpf <= 16'sd593;
			h68_lpf <= 16'sd676;
			h69_lpf <= 16'sd756;
			h70_lpf <= 16'sd831;
			h71_lpf <= 16'sd902;
			h72_lpf <= 16'sd967;
			h73_lpf <= 16'sd1027;
			h74_lpf <= 16'sd1079;
			h75_lpf <= 16'sd1124;
			h76_lpf <= 16'sd1162;
			h77_lpf <= 16'sd1192;
			h78_lpf <= 16'sd1213;
			h79_lpf <= 16'sd1226;
			h80_lpf <= 16'sd1231;

			h0_hpf <= 16'sd546;
			h1_hpf <= 16'sd134;
			h2_hpf <= 16'sd213;
			h3_hpf <= 16'sd296;
			h4_hpf <= 16'sd390;
			h5_hpf <= 16'sd486;
			h6_hpf <= 16'sd581;
			h7_hpf <= 16'sd680;
			h8_hpf <= 16'sd783;
			h9_hpf <= 16'sd890;
			h10_hpf <= 16'sd979;
			h11_hpf <= 16'sd1080;
			h12_hpf <= 16'sd1157;
			h13_hpf <= 16'sd1246;
			h14_hpf <= 16'sd1305;
			h15_hpf <= 16'sd1360;
			h16_hpf <= 16'sd1394;
			h17_hpf <= 16'sd1404;
			h18_hpf <= 16'sd1406;
			h19_hpf <= 16'sd1380;
			h20_hpf <= 16'sd1323;
			h21_hpf <= 16'sd1232;
			h22_hpf <= 16'sd1104;
			h23_hpf <= 16'sd960;
			h24_hpf <= 16'sd775;
			h25_hpf <= 16'sd520;
			h26_hpf <= 16'sd243;
			h27_hpf <= -16'sd84;
			h28_hpf <= -16'sd493;
			h29_hpf <= -16'sd930;
			h30_hpf <= -16'sd1426;
			h31_hpf <= -16'sd1984;
			h32_hpf <= -16'sd2607;
			h33_hpf <= -16'sd3298;
			h34_hpf <= -16'sd4060;
			h35_hpf <= -16'sd4860;
			h36_hpf <= -16'sd5772;
			h37_hpf <= -16'sd6726;
			h38_hpf <= -16'sd7761;
			h39_hpf <= -16'sd8880;
			h40_hpf <= -16'sd10086;
			h41_hpf <= -16'sd11340;
			h42_hpf <= -16'sd12685;
			h43_hpf <= -16'sd14080;
			h44_hpf <= -16'sd15615;
			h45_hpf <= -16'sd17158;
			h46_hpf <= -16'sd18800;
			h47_hpf <= -16'sd20496;
			h48_hpf <= -16'sd22246;
			h49_hpf <= -16'sd24100;
			h50_hpf <= -16'sd25959;
			h51_hpf <= -16'sd27924;
			h52_hpf <= -16'sd29945;
			h53_hpf <= -16'sd32022;
			h54_hpf <= -16'sd34100;
			h55_hpf <= -16'sd36288;
			h56_hpf <= -16'sd38418;
			h57_hpf <= -16'sd40658;
			h58_hpf <= -16'sd42893;
			h59_hpf <= -16'sd45180;
			h60_hpf <= -16'sd47458;
			h61_hpf <= -16'sd49724;
			h62_hpf <= -16'sd52038;
			h63_hpf <= -16'sd54272;
			h64_hpf <= -16'sd56550;
			h65_hpf <= -16'sd58806;
			h66_hpf <= -16'sd61037;
			h67_hpf <= -16'sd63240;
			h68_hpf <= -16'sd65343;
			h69_hpf <= -16'sd67480;
			h70_hpf <= -16'sd69509;
			h71_hpf <= -16'sd71496;
			h72_hpf <= -16'sd73365;
			h73_hpf <= -16'sd75258;
			h74_hpf <= -16'sd76950;
			h75_hpf <= -16'sd78660;
			h76_hpf <= -16'sd80157;
			h77_hpf <= -16'sd81666;
			h78_hpf <= -16'sd83029;
			h79_hpf <= -16'sd84240;
			h80_hpf <= -16'sd85374;
		end
	end
end


endmodule