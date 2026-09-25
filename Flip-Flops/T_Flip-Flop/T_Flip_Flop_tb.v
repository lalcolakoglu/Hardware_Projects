`timescale 1ns/1ps
module T_Flip_Flop_tb();
reg [3:0]T;
reg clock;
reg reset;
wire [3:0]Q;

T_Flip_Flop uut(
    .T(T),
    .clock(clock),
    .reset(reset),
    .Q(Q)
);
always #5 clock=~clock;
initial begin
    reset=1;
    clock=0;
    $monitor("T=%d, clock=%d, Q=%d",T,clock,Q);
    T[0]=1; T[1]=0; T[2]=0; T[3]=0;
    #10; reset=0;
    T[0]=0; T[1]=1; T[2]=0; T[3]=0;
    #10;
    T=4'b0100;
    #10;
    T=4'b1000;
    #10;
    T=4'b1010;

    $finish;
end
endmodule