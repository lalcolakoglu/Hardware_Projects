//32 bit MIPS ALU
module ALU(
    input  [31:0] A,
    input  [31:0] B,
    input  [2:0]  ALUControl,
    output reg [31:0] result,
    output zero
);
always @(*) begin
    result=32'b0;
    case (ALUControl)
        3'b000: result=A&B;
        3'b001: result=A|B;
        3'b010: result=A+B;
        3'b110: result=A-B;
    endcase
end
assign zero= (result==32'b0);
endmodule