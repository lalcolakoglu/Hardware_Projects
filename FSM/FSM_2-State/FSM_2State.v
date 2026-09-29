module FSM_2State(
    input clock,
    input reset
);
reg state;
reg next_state;


always @(*) begin
    case (state)
        1'b0: next_state=1'b1;
        1'b1: next_state=1'b0;
    endcase
end
always @(posedge clock) begin
    if (reset)
        state <= 1'b0;
    else
        state <= next_state;
end
endmodule