`timescale  1ns/1ps
module D_Flip_Flop_tb();
reg [3:0]D;
reg clock;
wire [3:0]Q;

D_Flip_Flop uut(
    .D(D),
    .clock(clock),
    .Q(Q)
);
always #5 clock =~clock;
initial begin
    clock=0;
    $monitor("D0=%d, D1=%d, D2=%d, D3=%d, clock=%d, Q=%d", D[0],D[1],D[2],D[3],clock,Q);
    D[0]=1; D[1]=0; D[2]=1; D[3]=0;
    #10;
    D[0]=0; D[1]=1; D[2]=0; D[3]=1;
    #10;
    D=4'b1111;
    #10;

    $finish;
end
endmodule