`timescale 1ns/1ps
module Control_Unit_tb();
reg [5:0] opcode;
wire RegDst;
wire ALUSrc;
wire MemToReg;
wire RegWrite;
wire MemRead;
wire MemWrite;
wire Branch;
wire [1:0]ALUOp;

Control_Unit uut(
    .opcode(opcode),
    .RegDst(RegDst),
    .ALUSrc(ALUSrc),
    .MemToReg(MemToReg),
    .RegWrite(RegWrite),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .Branch(Branch),
    .ALUOp(ALUOp)
);
initial begin
    $monitor("opcode=%b, RegDst=%b, ALUSrc=%b, MemToReg=%b, RegWrite=%b, MemRead=%b, MemWrite=%b, Branch=%b, ALUOp=%b",
    opcode, RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);
    #10;
    opcode=6'b000000;
    #10;
    opcode=6'b100011;
    #10;
    opcode=6'b101011;
    #10;
    opcode=6'b000100;
    #10;
    $finish;
end
endmodule