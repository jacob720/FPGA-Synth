`timescale 10 ns/1 ns
module UnsignedTo2sCompl20Bit_tb();

reg [19:0] DATAUnsigned;
wire [19:0] DATA2sCompl;
integer i;

UnsignedTo2sCompl20Bit dut(DATAUnsigned, DATA2sCompl);

initial begin

for (i = 0; i< 1000000; i = i+10000 ) begin
	DATAUnsigned = i;
	#1;
end

$stop;

end


endmodule
