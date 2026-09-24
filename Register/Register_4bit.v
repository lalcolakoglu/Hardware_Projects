module Register_4bit (
    input [3:0] in,
    input clock,
    input reset,
    output reg [3:0] out
);

always @(posedge clock) begin
    case(reset)
        0: out=in;
        1: out=4'b0000;
    endcase
end

endmodule