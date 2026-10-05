`timescale 1ns/1ps
module ALU_Control_tb();
reg [1:0] ALUOp;
reg [5:0] func;
wire [2:0] ALUControl;

ALU_Control uut(
    .ALUOp(ALUOp),
    .func(func),
    .ALUControl(ALUControl)
);
initial begin
    $monitor("ALUOp=%b, func=%b, ALUControl=%b",ALUOp,func,ALUControl);
    #10;
    ALUOp=2'b00; 
    #10;
    ALUOp=2'b01; 
    #10;
    ALUOp=2'b10; func=6'b100000;
    #10;
    ALUOp=2'b10; func=6'b100010;
    #10;
    ALUOp=2'b10; func=6'b100100;
    #10;
    ALUOp=2'b10; func=6'b100101;
    #10;
    $finish;
end
endmodule