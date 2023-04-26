module DTypeFF(
    input clk,
    input D,
    output reg Q
);

	initial begin
		
		Q = 1'b0;
		
	end
	
    always @ (posedge clk) 
    begin

        Q <= D;
	
    end

endmodule


