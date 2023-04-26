module Counter100Hz (
	input CLK_50_MHz,
	input reset_n,
	output [18:0] c
	
);
	wire [18:0] f; //output !Q
	assign f = ~c; //bitwise not - takes the Q output and inverts it



DTypeFFR ff0 (
		
	CLK_50_MHz,//input clk,
	reset_n,   //input reset_n,
	f[0],//input D, C = !Q input
	c[0]   //output reg Q
	
	);
	
	
DTypeFFR ff1 (
		
	f[0], 
	reset_n,  
	f[1],
	c[1]  
	
	);
	

DTypeFFR ff2 (
		
	f[1], 
	reset_n,   
	f[2], 
	c[2]   
	
	);
	
	
DTypeFFR ff3 (
		
	f[2], 
	reset_n,  
	f[3], 
	c[3]  
	
	);
	

DTypeFFR ff4 (
		
	f[3], 
	reset_n,   
	f[4], 
	c[4]   
	
	);

	
DTypeFFR ff5 (
		
	f[4], 
	reset_n,   
	f[5], 
	c[5]  
	
	);
	
	
DTypeFFR ff6 (
		
	f[5], 
	reset_n,   
	f[6], 
	c[6]  
	
	);
	
	
DTypeFFR ff7 (
		
	f[6], 
	reset_n,  
	f[7], 
	c[7]  
	
	);

	
DTypeFFR ff8 (
		
	f[7], 
	reset_n,  
	f[8], 
	c[8]   
	
	);
	
	
DTypeFFR ff9 (
		
	f[8],
	reset_n, 
	f[9], 
	c[9]   
	
	);
	
DTypeFFR ff10 (
		
	f[9], 
	reset_n,  
	f[10], 
	c[10]   
	
	);
	
	
DTypeFFR ff11 (
		
	f[10], 
	reset_n,  
	f[11], 
	c[11]  
	
	);
	
DTypeFFR ff12 (
		
	f[11], 
	reset_n,   
	f[12], 
	c[12]  
	
	);


DTypeFFR ff13 (
		
	f[12], 
	reset_n,   
	f[13], 
	c[13]  
	
	);

	
DTypeFFR ff14 (
		
	f[13], 
	reset_n,  
	f[14], 
	c[14]    
	
	);
	
DTypeFFR ff15 (
		
	f[14], 
	reset_n,    
	f[15], 
	c[15]   
	
	);
	
DTypeFFR ff16 (
		
	f[15], 
	reset_n,  
	f[16], 
	c[16]   
	
	);
	
DTypeFFR ff17 (
		
	f[16], 
	reset_n, 
	f[17], 
	c[17]    
	
	);
	
DTypeFFR ff18 (
		
	f[17], 
	reset_n, 
	f[18], 
	c[18]    
	
	);
	

endmodule
