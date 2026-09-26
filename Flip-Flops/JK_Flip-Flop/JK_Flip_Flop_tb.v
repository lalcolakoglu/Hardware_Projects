module JK_Flip_Flop_tb();
reg [3:0]J;
reg [3:0]K;
reg clock;
reg reset;
wire [3:0]Q;

JK_Flip_Flop uut(
    .J(J),
    .K(K),
    .clock(clock),
    .reset(reset),
    .Q(Q)
);
always #5 clock=~clock;
initial begin
    clock=0;
    reset=0;
    $monitor("J=%b, K=%b, clock=%b, Q=%b",J,K,clock,Q);
    J=4'b0000; K=4'b0000;
    #10;
    J=4'b0000;   K=4'b1111;
    #10;
    J=4'b1111; K=4'b0000;
    #10;
    J=4'b1111; K=4'b1111;
    #10;

    
    $finish;
end
endmodule