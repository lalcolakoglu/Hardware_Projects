module CPU(
    input clock,
    input reset
);
wire [31:0] PC;
wire Branch;
wire zero;
wire PCSrc;
assign PCSrc = Branch & zero;
wire [31:0] next_PC;
assign next_PC = PCSrc ? branch_target : PC_Plus_4;
Program_Counter pc(
    .reset(reset),
    .clock(clock),
    .PC(PC),
    .next(next_PC)
);
wire [31:0] PC_Plus_4;
assign PC_Plus_4=32'd4+PC;
wire [31:0] instruction;
Instruction_Memory memory(
    .instruction(instruction),
    .address(PC)
);
wire [31:0] result;

wire [31:0] extended;
wire [31:0] branch_offset;
assign branch_offset = extended << 2;
wire [31:0] branch_target;
assign branch_target = branch_offset+PC_Plus_4;
CPU_Datapath datapath(
    .instruction(instruction), 
    .reset(reset),
    .clock(clock),
    .result(result),
    .Branch(Branch),
    .zero(zero),
    .extended(extended)
);



endmodule