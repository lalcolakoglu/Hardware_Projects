module CPU_Datapath(
    input [31:0] instruction, //ins mem
    input reset,
    input clock,
    output [31:0] result,
    output Branch,
    output zero,
    output [31:0] extended
);

//field, contorl unit
wire [5:0] opcode;
wire [4:0] rs;
wire [4:0] rt;
wire [4:0] rd;
wire [5:0] func;
wire [15:0] immediate;
Instruction_Field Field(
    .instruction(instruction),
    .opcode(opcode),
    .rs(rs),
    .rt(rt),
    .rd(rd),
    .func(func),
    .immediate(immediate)
);
wire RegDst;
wire ALUSrc;
wire MemToReg;
wire RegWrite;
wire MemRead;
wire MemWrite;

wire [1:0]ALUOp;
Control_Unit CUnit(
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
wire [4:0] write_register;
wire [4:0] write_addr;
wire [31:0] write_data;
wire [31:0] read_data1;
wire [31:0] read_data2;
assign write_register=RegDst?rd:rt;


wire [31:0] A;
wire [31:0] B;
Register_File File(
    .clock(clock),
    .reset(reset),
    .RegWrite(RegWrite),
    .read_addr1(rs),
    .read_addr2(rt),
    .write_addr(write_register),
    .write_data(write_data),
    .read_data1(A),
    .read_data2(read_data2)
);
wire [31:0] memory_read_data;
assign write_data = MemToReg ? memory_read_data : result; //MUX
wire [2:0] ALUControl;
ALU_Control alucontrol(
    .ALUOp(ALUOp),
    .func(func),
    .ALUControl(ALUControl)
);


ALU alu(
    .A(A),
    .B(B),
    .ALUControl(ALUControl),
    .result(result),
    .zero(zero)
);

Sign_Extension sign_extension(
    .immediate(immediate),
    .extended(extended)
);
assign B=ALUSrc?extended:read_data2;
Data_Memory data_memory(
    .write_data(read_data2),
    .reset(reset),
    .clock(clock),
    .address(result),
    .read(MemRead),
    .write(MemWrite),

    .read_data(memory_read_data)
);
endmodule