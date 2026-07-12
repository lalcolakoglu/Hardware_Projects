`timescale 1ns/1ps
module MUX_4to1_ac_tb;
reg [3:0] in1;
reg [3:0] in2;
reg [3:0] in3;
reg [3:0] in4;
reg [1:0] sel;
wire [3:0] y;

MUX_4to1_ac uut( //change MUX_4to1_aif for test if else
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .sel(sel),
    .y(y)
);

initial begin
    $monitor("in1=%b,in2=%b,in2=%b,in2=%b,sel=%b,y=%b",in1,in2,in3,in4,sel,y);
    in1=4'b1111;
    in2=4'b1110;
    in3=4'b1010;
    in4=4'b0010;
    sel=2'b00;
    #10;
    sel=2'b01;
    #10;
    sel=2'b10;
    #10;
    sel=2'b11;
    #10;
    $finish;
end
endmodule
