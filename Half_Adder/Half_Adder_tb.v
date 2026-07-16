`timescale 1ns/1ps
module Half_Adder_tb;

reg A;
reg B;
wire sum;
wire carry;

Half_Adder uut(
    .A(A),
    .B(B),
    .sum(sum),
    .carry(carry)
);
initial begin
    $monitor("A=%b,B=%b,sum=%b,carry=%b", A,B,sum,carry);
    A=0;
    B=0;
    #10;
    A=0;
    B=1;
    #10;
    A=1;
    B=0;
    #10;
    A=1;
    B=1;
    #10;
    $finish;
end

endmodule

