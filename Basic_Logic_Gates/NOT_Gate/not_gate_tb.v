`timescale 1ns/1ps
module not_gate_tb;

reg c;
wire e;

not_gate uut(
    .c(c),
    .e(e)
);

initial begin
    $monitor("c=%b,e=%b",c,e);
    c=0;
    #10;
    c=1;
    #10;
    $finish;
end


endmodule
