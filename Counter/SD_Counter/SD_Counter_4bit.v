module SD_Counter_4bit(
    
    input clock,
    input reset,
    output reg [3:0] Qout 
);

always @(posedge clock) begin
    if (reset)
        Qout=4'b0000;
    else begin
        Qout[0]=~Qout[0];
        case ({Qout[0]})
            1'b1: Qout[1]=~Qout[1];
        endcase
        case ({Qout[0], Qout[1]})
            2'b11: Qout[2]=~Qout[2];
        endcase
        case ({Qout[0], Qout[1], Qout[2]})
            3'b111: Qout[3]=~Qout[3];
        endcase

        

    end
end
endmodule