module SU_Counter_4bit(
    
    input clock,
    input reset,
    output reg [3:0] Qout 
);

always @(posedge clock) begin
    if (reset)
        Qout<=4'b0000;
    else begin
        
        case ({Qout[0]})
            1'b1: Qout[0]<=1'b0;
            1'b0: Qout[0]<=1'b1;
        endcase
        case ({Qout[0], Qout[1]})
            2'b11: Qout[1]<=1'b0;
            2'b10: Qout[1]<=1'b1;
        endcase
        case ({Qout[0], Qout[1], Qout[2]})
            3'b111: Qout[2]<=1'b0;
            3'b110: Qout[2]<=1'b1;
        endcase
        case ({Qout[0], Qout[1], Qout[2],Qout[3]})
            4'b1111: Qout[3]<=1'b0;
            4'b1110: Qout[3]<=1'b1;
        endcase
       
        

    end
end
endmodule