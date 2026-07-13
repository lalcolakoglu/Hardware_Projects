`timescale 1ns/1ps
module Decoder_2to4_c_tb;
reg [1:0] A;
wire [3:0] y;

Decoder_2to4_c uut( //change Decoder_2to4_if to test if else statements
    .A(A),
    .y(y)
);

initial begin
    $monitor("A=%b, y=%b",A,y);
    A=2'b00;
    #10;
    A=2'b01;
    #10;
    A=2'b10;
    #10;
    A=2'b11;
    #10;
    $finish;
end

endmodule