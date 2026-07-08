`timescale 1ns/1ps
module or_gate_tb;
reg a;
reg b;
wire c;

or_gate uut(
    .a(a),
    .b(b),
    .c(c)
);

initial begin
    $monitor("a=%b,b=%b,c=%b",a,b,c);
    a=0;
    b=0;
    #10;
    a=0;
    b=1;
    #10;
    a=1;
    b=0;
    #10;
    a=1;
    b=1;
    #10;
    $finish;
end
endmodule
