module Instruction_Decoder (
    input [7:0] instruction,
    output reg add,
    output reg sub,
    output reg load,
    output reg store,
    output reg [1:0]register,
    output reg [3:0]operand

);
// [7:6] opcode   [5:4] register  [3:0] operand

always @(*) begin
    add=0; sub=0; load=0; store=0; register=2'b00; operand=4'b0000;
    register=instruction[5:4]; operand=instruction[3:0];
    case (instruction[7:6]) 
        2'b00: add=1;
        
        2'b01: sub=1;
        
        2'b10: load=1; 
        
        2'b11: store=1;
        
    endcase
    
end
endmodule