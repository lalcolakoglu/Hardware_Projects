`timescale 1ns/1ps
module MIPS_ALU_tb();
reg [5:0] opcode;
reg [5:0] func;
reg [31:0] A;
reg [31:0] B;
wire [31:0] result;
wire zero;
MIPS_ALU uut(
    .opcode(opcode),
    .func(func),
    .A(A),
    .B(B),
    .result(result),
    .zero(zero)
);
initial begin
    $monitor("opcode=%b, func=%b, A=%d, B=%d, result=%d, zero=%d",opcode,func,A,B,result,zero);
    #10;
    opcode=6'b0; func=6'b100000; A=10; B=5;
    #10;
    opcode=6'b0; func=6'b100010; A=10; B=5;
    #10;
    opcode=6'b0; func=6'b100100; A=10; B=5;
    #10;
    opcode=6'b0; func=6'b100101; A=10; B=5;
    #10;
    opcode=6'b100011; A=100; B=20;
    #10;
    opcode=6'b000100; A=20; B=20;
    #10;
    
    $finish;
end

endmodule