`timescale 1ns/1ps

module MUX_2to1_tb;
reg [3:0] in1;
reg [3:0]in2;
reg sel;
wire [3:0]out;

MUX_2to1 uut(
    .in1(in1),
    .in2(in2),
    .sel(sel),
    .out(out)
);

initial begin
    $monitor("in1=%b, in2=%b, sel=%b, out=%b",in1,in2,sel,out);
    in1=4'b0101;
    in2=4'b1100;
    sel=0;
    #10;
    sel=1;
    #10;
    $finish;
end
endmodule
