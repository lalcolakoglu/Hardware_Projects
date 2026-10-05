module ALU_Control (
    input [1:0] ALUOp,
    input [5:0] func,
    output reg [2:0] ALUControl
);
always @(*) begin
    
    case (ALUOp)
        2'b00:  ALUControl=3'b010; //LW,SW
        2'b01:  ALUControl=3'b110; //BEQ
        2'b10: begin //func
            case(func)
                6'b100000: ALUControl=3'b010; //add
                6'b100010: ALUControl=3'b110; //sub
                6'b100100: ALUControl=3'b000; //and
                6'b100101: ALUControl=3'b001; //or
            endcase
        end
        
    endcase
end
endmodule