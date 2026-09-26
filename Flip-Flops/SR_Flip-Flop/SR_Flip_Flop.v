module SR_Flip_Flop(
    input [3:0] S,
    input [3:0] R,
    input clock,
    input reset,
    output reg [3:0] Q
);

always @(posedge clock) begin
    if (reset)
        Q=4'b0000;
    else begin
         case({S[0], R[0]})
            2'b00: Q[0]=Q[0]; // no change
            2'b01: Q[0]=1'b0;  // reset
            2'b10: Q[0]=1'b1;  // set
              
        endcase
        case({S[1], R[1]})
            2'b00: Q[1]=Q[1]; // no change
            2'b01: Q[1]=1'b0;  // reset
            2'b10: Q[1]=1'b1;  // set
            
        endcase
        case({S[2], R[2]})
            2'b00: Q[2]=Q[2]; // no change
            2'b01: Q[2]=1'b0;  // reset
            2'b10: Q[2]=1'b1;  // set
           
        endcase
        case({S[3], R[3]})
            2'b00: Q[3]=Q[3]; // no change
            2'b01: Q[3]=1'b0;  // reset
            2'b10: Q[3]=1'b1;  // set
            
        endcase
    end
end
endmodule