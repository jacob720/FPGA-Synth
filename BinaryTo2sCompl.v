module BinaryTo2sCompl(

input [19:0] DataUnsigned,

output [23:0] Data2sCompl

);

//Just use the positive part of 2's complement for now

assign Data2sCompl = {DataUnsigned, 4'b0000};


endmodule
