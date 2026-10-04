`timescale 1ns/1ps
module Instruction_Decoder_tb();
reg [7:0] instruction;
wire add;
wire sub;
wire load;
wire store;
wire [1:0]register;
wire [3:0]operand;

Instruction_Decoder uut(
    .instruction(instruction),
    .add(add),
    .sub(sub),
    .load(load),
    .store(store),
    .register(register),
    .operand(operand)
);
initial begin
    $monitor("instruction=%b, add=%b, sub=%b, load=%b, store=%b, register=%b, operand=%b"
    ,instruction,add,sub,load,store,register,operand);
    #10;
    instruction=8'b00100101;
    #10;
    instruction=8'b01101111;
    #10;
    instruction=8'b10110000;
    #10;
    instruction=8'b11010010;
    #10;
    $finish;
end
endmodule