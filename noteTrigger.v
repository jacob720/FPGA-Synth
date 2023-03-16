//trigger module
//sends note off note on signals to ADSR
//posedge - on - negedge off

module noteTrigger (

input clk,
input [3:0] counter,
output reg [15:0] Trigger

);

always@(posedge clk) begin

	case(counter)
	
	4'b0000 : begin 
					Trigger[0] = 1;
					Trigger[15] = 0;
				end
	4'b0001 : begin 
					Trigger[1] = 1;
					Trigger[0] = 0;
				end
	4'b0010 : begin 
					Trigger[2] = 1;
					Trigger[1] = 0;
				end
	4'b0011 : begin 
					Trigger[3] = 1;
					Trigger[2] = 0;
				end
	4'b0100 : begin 
					Trigger[4] = 1;
					Trigger[3] = 0;
				end
	4'b0101 : begin 
					Trigger[5] = 1;
					Trigger[4] = 0;
				end
	4'b0110 : begin 
					Trigger[6] = 1;
					Trigger[5] = 0;
				end
	4'b0111 : begin 
					Trigger[7] = 1;
					Trigger[6] = 0;
				end
	4'b1000 : begin 
					Trigger[8] = 1;
					Trigger[7] = 0;
				end
	4'b1001 : begin 
					Trigger[9] = 1;
					Trigger[8] = 0;
				end
	4'b1010 : begin 
					Trigger[10] = 1;
					Trigger[9] = 0;
				end
	4'b1011 : begin 
					Trigger[11] = 1;
					Trigger[10] = 0;
				end
	4'b1100	: begin 
					Trigger[12] = 1;
					Trigger[11] = 0;
				end
	4'b1101 : begin 
					Trigger[13] = 1;
					Trigger[12] = 0;
				end
	4'b1110 : begin 
					Trigger[14] = 1;
					Trigger[13] = 0;
				end
	4'b1111 : begin 
					Trigger[15] = 1;
					Trigger[14] = 0;
				end
				
	default : begin 
					Trigger[0] = 1;
					Trigger[15] = 0;
				end
				
	endcase

end

endmodule