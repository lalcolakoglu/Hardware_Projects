module SR_Flip_Flop_tb();
reg [3:0]S;
reg [3:0]R;
reg clock;
reg reset;
wire [3:0]Q;

SR_Flip_Flop uut(
    .S(S),
    .R(R),
    .reset(reset),
    .clock(clock),
    .Q(Q)
);
always #5 clock=~clock;
initial begin
    clock=0; reset=0;
    $monitor("S=%b, R=%b, clock=%b, Q=%b",S,R,clock,Q);
    S=4'b0000; R=4'b0000;
    #10;
    S=4'b0000; R=4'B1111;
    #10;
    S=4'b1111; R=4'b0000;
    #10;
    
    $finish;
end
endmodule