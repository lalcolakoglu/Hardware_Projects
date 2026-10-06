module Instruction_Memory(
    output [31:0] instruction,
    input [31:0] address

);
reg [31:0] memory [0:235];
initial begin
    memory[0]=32'd45645;
    memory[1]=32'd0;
    memory[2]=32'hABFC;
end 
assign instruction = memory[address[9:2]];
endmodule