`timescale 10 ns/ 1 ns

module PLL12M6M48k_tb ();
	
reg areset;
reg inclk0;

wire	c0;
wire	c1;
wire	c2;
wire	locked;


always begin
	//clock
	#1;
	inclk0 <= ~inclk0;
end

PLL12M6M48kS dut(areset, inclk0, c0, c1, c2, locked);

initial begin

//initialisation
inclk0	<= 0;
areset <= 0;
#2;
areset<=1;
#2;
areset<=0;


#500000;

$stop;

end	
	
	
endmodule
