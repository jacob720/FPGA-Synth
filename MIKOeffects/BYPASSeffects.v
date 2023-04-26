module BYPASSeffects(
	input EffectsBypass,
	input [19:0] AudioLeftReverb,
	input [19:0] AudioLeftADSR,
	
	output [19:0] AudioLeftEffects

);

assign AudioLeftEffects = {20{!EffectsBypass}}&AudioLeftReverb|{20{EffectsBypass}}&AudioLeftADSR;



endmodule
