`timescale 1ns/1ps
module Full_Adder_tb;
reg A;
reg B;
reg C;
wire carry1;
wire carry2;
wire carry_out;
wire sum1;
wire sum2;

Full_Adder uut(
    .A(A),
    .B(B),
    .C(C),
    .carry1(carry1),
    .carry2(carry2),
    .carry_out(carry_out),
    .sum1(sum1),
    .sum2(sum2)
);

initial begin
    $monitor("A=%b,B=%b,C=%b,carry1=%b,carry2=%b,carry_out=%b,sum1=%b,sum2=%b",A,B,C,carry1,carry2,carry_out,sum1,sum2);
    A=0; B=0; C=0;
    #10;
    A=0; B=0; C=1;
    #10;
    A=0; B=1; C=0;
    #10;
    A=0; B=1; C=1;
    #10;
    A=1; B=0; C=0;
    #10;
    A=1; B=0; C=1;
    #10;
    A=1; B=1; C=0;
    #10;
    A=1; B=1; C=1;
    #10;
    $finish;
end

endmodule

