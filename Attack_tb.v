`timescale 1 ns / 100 ps

module Attack_tb;
	reg clk;
	reg clk_a;
	reg [19:0]in;
	reg note_on;
	wire [19:0]out;
	wire start_decay;
	wire [4:0] shift_amount;
	
	Attack dut(
		clk,
		clk_a,
		in,
		note_on,
		out,
		start_decay,
		shift_amount
	);
	
	integer i;
	integer j;
	integer a;
	
	always begin
		clk = ~clk;
		#2;
	end
	
	always begin
		clk_a = ~clk_a;
		#a;
	end
	
	always begin
		in = ~in;
		#10;
	end
	

	initial begin
		clk=1'b1;
		clk_a = 1'b1;
		in=20'b11111111111111111111;
		note_on = 1'b0;
		a = $urandom()%20;
		//in= $urandom()%256;
		#10;
		for(j=0;j<4;j=j+1) begin
			note_on=1'b1;
			for(i=0; i<50; i=i+1) begin
			//in= $urandom()%256;
			#10;
			end
			note_on=1'b0;
			#20;
		end
	$stop;
	end


endmodule