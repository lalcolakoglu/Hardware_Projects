`timescale 1ns/1ps
module Instruction_Field_tb();
reg [31:0]instruction;
wire [5:0] opcode;
wire [4:0] rs;
wire [4:0] rt;
wire [4:0] rd;
wire [5:0] func;
wire [15:0] immediate;
Instruction_Field uut(
    .instruction(instruction),
    .opcode(opcode),
    .rs(rs),
    .rd(rd),
    .rt(rt),
    .func(func),
    .immediate(immediate)
);
initial begin
    $monitor("instruction=%b, opcode=%b, rs=%b, rd=%b, rt=%b, func=%b, immediate=%b",
    instruction,opcode,rs,rd,rt,func,immediate);
    #10;
    instruction=32'b10001110011010000000000000001000;
    #10;
    $finish;
end

endmodule