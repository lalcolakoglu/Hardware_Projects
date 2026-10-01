`timescale 1ns/1ps
module Comparator_4bit_tb ();
reg [3:0]A;
reg [3:0]B;
wire greater;
wire equal;
wire less;

Comparator_4bit uut(
    .A(A),
    .B(B),
    .greater(greater),
    .less(less),
    .equal(equal)
);

initial begin
    $monitor("A=%b, B=%b, greater=%d, equal=%d, less=%d",A,B,greater,equal,less);
    #10;
    A=4'b0011;
    B=4'b0100;
    #10;
    A=4'b1010;
    B=4'b0100;
    #10;
    A=4'b0011;
    B=4'b0011;
    #10;
    $finish;
end
endmodule