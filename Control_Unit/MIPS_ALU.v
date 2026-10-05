module MIPS_ALU(
    input [5:0] opcode,
    input [5:0] func,
    input [31:0] A,
    input [31:0] B,
    output [31:0] result,
    output zero

);
wire [1:0]ALUOp;
wire [2:0]ALUControl;
Control_Unit control_unit(
    .ALUOp(ALUOp),
    .opcode(opcode)
);
ALU_Control alu_control(
    .ALUOp(ALUOp),
    .ALUControl(ALUControl),
    .func(func)
);
ALU alu(
    .A(A),
    .B(B),
    .ALUControl(ALUControl),
    .result(result),
    .zero(zero)
);
endmodule