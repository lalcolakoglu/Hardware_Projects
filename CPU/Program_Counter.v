module Program_Counter(
    input reset,
    input clock,
    input [31:0] next,
    output reg [31:0] PC
);
always @(posedge clock) begin
    if (reset) 
        PC<=32'b0;
    else begin
        PC<=next;
    end

end
endmodule