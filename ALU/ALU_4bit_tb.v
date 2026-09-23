`timescale 1ns/1ps
module ALU_4bit_tb();
reg [3:0]A;
reg [3:0]B;
reg [1:0] operation;
wire [3:0] result;
wire carry_out;

ALU_4bit uut(
    .A(A),
    .B(B),
    .operation(operation),
    .result(result),
    .carry_out(carry_out)
);
initial begin
    $monitor("A=%d,B=%d,operation=%d,result=%d,cary_out=%d",A,B,operation,result,carry_out);
    #10;
    A=4'b0101; B=4'b0011; operation=2'b00;
    #10;
    A=4'b0101; B=4'b0011; operation=2'b01;
    #10;
    A=4'b0011; B=4'b0101; operation=2'b01;
    #10;
    A=4'b0100; B=4'b0000; operation=2'b10;
    #10;
    A=4'b0100; B=4'b0001; operation=2'b11;
    #10;
    $finish;
    
end

endmodule