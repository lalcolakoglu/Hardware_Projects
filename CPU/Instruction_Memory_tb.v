`timescale 1ns/1ps
module Instruction_Memory_tb();
wire [31:0] instruction;
reg [31:0] address;
Instruction_Memory uut(
    .instruction(instruction),
    .address(address)
);
initial begin
    $monitor("time=%0t, instruction=%d, address=%d",$time,instruction,address);
    #10;
    address=0;
    #10;
    address=4; 
    #10;
    address=8;
    #10;
    $finish;
end
endmodule