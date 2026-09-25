
module D_Flip_Flop(
    input [3:0]D,      
    input clock,
    output reg [3:0]Q
);
// only on the positive edge Q becomes D
always @(posedge clock) begin
    Q[0]=D[0];
    Q[1]=D[1];
    Q[2]=D[2];
    Q[3]=D[3];
end
endmodule