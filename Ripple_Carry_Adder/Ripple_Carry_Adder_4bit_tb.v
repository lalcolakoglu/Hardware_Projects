`timescale 1ns/1ps
module Ripple_Carry_Adder_4bit_tb;
reg [3:0] A;
reg [3:0] B;
reg Cin;
wire [3:0] sum;
wire carry1;
wire carry2;
wire carry3;
wire carry_out;

Ripple_Carry_Adder_4bit uut(
    .A(A),
    .B(B),
    .Cin(Cin),
    .sum(sum),
    .carry1(carry1),
    .carry2(carry2),
    .carry3(carry3),
    .carry_out(carry_out)

);
initial begin
    $monitor("A=%d,B=%d,Cin=%d,sum=%d,carry_out=%d", A,B,Cin,sum,carry_out);
    A=4'b1011; B=4'b0010; Cin=0;
    #10;
    A=4'b1000; B=4'b1000; Cin=0;
    #10;
    A=4'b1000; B=4'b1000; Cin=1;
    #10;
    $finish;
end
endmodule