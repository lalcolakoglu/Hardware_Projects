module Instruction_Memory(
    output [31:0] instruction,
    input [31:0] address

);
reg [31:0] memory [0:235];
initial begin
    memory[0] = 32'b10101100000010010000000000000100; //sw
    memory[1]= 32'b10001100000010000000000000000100; //lw
    memory[3]=32'b00010001000010010000000000000001; //beq
end 
assign instruction = memory[address[9:2]];
endmodule