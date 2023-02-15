module Counter100Hz (
	input CLK_50_MHz,
	input reset_n,
	output [18:0] c
	
);
	wire [18:0] f; //output !Q
	assign f = ~c; //bitwise not - takes the Q output and inverts it



DTypeFF ff0 (
		
	CLK_50_MHz,//input clk,
	reset_n,   //input reset_n,
	f[0],//input D, C = !Q input
	c[0]   //output reg Q
	
	);
	
	
DTypeFF ff1 (
		
	f[0], 
	reset_n,  
	f[1],
	c[1]  
	
	);
	

DTypeFF ff2 (
		
	f[1], 
	reset_n,   
	f[2], 
	c[2]   
	
	);
	
	
DTypeFF ff3 (
		
	f[2], 
	reset_n,  
	f[3], 
	c[3]  
	
	);
	

DTypeFF ff4 (
		
	f[3], 
	reset_n,   
	f[4], 
	c[4]   
	
	);

	
DTypeFF ff5 (
		
	f[4], 
	reset_n,   
	f[5], 
	c[5]  
	
	);
	
	
DTypeFF ff6 (
		
	f[5], 
	reset_n,   
	f[6], 
	c[6]  
	
	);
	
	
DTypeFF ff7 (
		
	f[6], 
	reset_n,  
	f[7], 
	c[7]  
	
	);

	
DTypeFF ff8 (
		
	f[7], 
	reset_n,  
	f[8], 
	c[8]   
	
	);
	
	
DTypeFF ff9 (
		
	f[8],
	reset_n, 
	f[9], 
	c[9]   
	
	);
	
DTypeFF ff10 (
		
	f[9], 
	reset_n,  
	f[10], 
	c[10]   
	
	);
	
	
DTypeFF ff11 (
		
	f[10], 
	reset_n,  
	f[11], 
	c[11]  
	
	);
	
DTypeFF ff12 (
		
	f[11], 
	reset_n,   
	f[12], 
	c[12]  
	
	);


DTypeFF ff13 (
		
	f[12], 
	reset_n,   
	f[13], 
	c[13]  
	
	);

	
DTypeFF ff14 (
		
	f[13], 
	reset_n,  
	f[14], 
	c[14]    
	
	);
	
DTypeFF ff15 (
		
	f[14], 
	reset_n,    
	f[15], 
	c[15]   
	
	);
	
DTypeFF ff16 (
		
	f[15], 
	reset_n,  
	f[16], 
	c[16]   
	
	);
	
DTypeFF ff17 (
		
	f[16], 
	reset_n, 
	f[17], 
	c[17]    
	
	);
	
DTypeFF ff18 (
		
	f[17], 
	reset_n, 
	f[18], 
	c[18]    
	
	);
	

endmodule
