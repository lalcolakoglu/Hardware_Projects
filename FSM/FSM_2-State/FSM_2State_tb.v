module FSM_2State_tb();
reg clock;
reg reset;
FSM_2State uut(
    .clock(clock),
    .reset(reset)
);
always #5 clock=~clock;
initial begin
    clock=0; reset=1;
    $monitor("state=%b, clock=%d",uut.state,clock);
    #10;
    reset=0;
    #60;
    $finish;

end
endmodule