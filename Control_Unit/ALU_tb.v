`timescale 1ns/1ps
module ALU_tb();
reg  [31:0] A;
reg  [31:0] B;
reg  [2:0]  ALUControl;
wire [31:0] result;
wire zero;

ALU uut(
    .A(A),
    .B(B),
    .ALUControl(ALUControl),
    .result(result),
    .zero(zero)
);
initial begin
    $monitor("A=%d, B=%d, result=%d, zero=%d",A,B,result,zero);
    #10;
    A=10; B=5; ALUControl=3'b000;
    #10;
    A=10; B=5; ALUControl=3'b001;
    #10;
    A=10; B=5; ALUControl=3'b010;
    #10;
    A=10; B=5; ALUControl=3'b110;
    #10;
    A=5; B=5; ALUControl=3'b110;
    #10;
    $finish;
end
endmodule