`timescale 1ns/1ps
module Encoder_4to2_c_tb;

reg [3:0] A;
wire [1:0] y;

Encoder_4to2_c uut(
    .A(A),
    .y(y)
);

initial begin
    $monitor("A=%b,y=%b",A,y);
    A=4'b0001;
    #10;
     A=4'b0010;
    #10;
     A=4'b0100;
    #10;
     A=4'b1000;
    #10;
    A=4'b1111;
    #10;
    $finish;
end
endmodule
