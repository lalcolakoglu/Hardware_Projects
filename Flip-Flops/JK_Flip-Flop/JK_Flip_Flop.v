module JK_Flip_Flop (
    input [3:0]J,
    input [3:0]K,
    input clock,
    input reset,
    output reg [3:0] Q
   
);

always @(posedge clock) begin
    if (reset)
        Q=4'b0000;
    else begin

        case({J[0], K[0]})
            2'b00: Q[0]=Q[0]; // no change
            2'b01: Q[0]=1'b0;  // reset
            2'b10: Q[0]=1'b1;  // set
            2'b11: Q[0]=~Q[0];    // toggle  
        endcase
        case({J[1], K[1]})
            2'b00: Q[1]=Q[1]; // no change
            2'b01: Q[1]=1'b0;  // reset
            2'b10: Q[1]=1'b1;  // set
            2'b11: Q[1]=~Q[1];    // toggle  
        endcase
        case({J[2], K[2]})
            2'b00: Q[2]=Q[2]; // no change
            2'b01: Q[2]=1'b0;  // reset
            2'b10: Q[2]=1'b1;  // set
            2'b11: Q[2]=~Q[2];    // toggle  
        endcase
        case({J[3], K[3]})
            2'b00: Q[3]=Q[3]; // no change
            2'b01: Q[3]=1'b0;  // reset
            2'b10: Q[3]=1'b1;  // set
            2'b11: Q[3]=~Q[3];    // toggle  
        endcase
    end

end
endmodule