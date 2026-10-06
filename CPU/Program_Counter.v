module Program_Counter(
    input reset,
    input clock,
    output reg [31:0] PC
);
always @(posedge clock) begin
    if (reset) 
        PC<=32'b0;
    else begin
        PC<=PC+32'd4;
    end

end
endmodule