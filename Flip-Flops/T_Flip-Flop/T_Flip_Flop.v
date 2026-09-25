module T_Flip_Flop(
    input [3:0]T,
    input clock,
    input reset,
    output reg [3:0]Q
);

// when t=1, Q toggles
always @(posedge clock) begin
    if (reset)
        Q=4'b0000;
    else 
       Q=Q^T;  //xor gate=00 0 , 01 1, 10 1, 11 0
    
end

endmodule