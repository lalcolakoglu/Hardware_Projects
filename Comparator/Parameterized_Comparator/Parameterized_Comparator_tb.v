`timescale 1ns/1ps
module Parameterized_Comparator_tb();
reg [7:0]A8;
reg [7:0]B8;
reg [15:0]A16;
reg [15:0]B16;
wire greater8;
wire equal8;
wire less8;
wire greater16;
wire equal16;
wire less16;
Parameterized_Comparator #(.width(16)) comparator1 (
    .A(A16),
    .B(B16),
    .greater(greater16),
    .less(less16),
    .equal(equal16)
);
Parameterized_Comparator #(.width(8)) comparator2 (
    .A(A8),
    .B(B8),
    .greater(greater8),
    .less(less8),
    .equal(equal8)
);
initial begin
    A8=8'b00000000; B8=8'b00000000; A16=16'b0000000000000000; B16=16'b0000000000000000; 
    $monitor("A8=%b, B8=%b, greater=%d, equal=%d, less=%d, \nA16=%b, B16=%b, greater=%d, equal=%d, less=%d",A8,B8,greater8,equal8,less8,A16,B16,greater16,equal16,less16);
    #10;
    A8=8'b00000011;
    B8=8'b10110100;
    A16=16'b1111111111110011;
    B16=16'b0000000000000100;
    #10;
    $finish;

end
endmodule