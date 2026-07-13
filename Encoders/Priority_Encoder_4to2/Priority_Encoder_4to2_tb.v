`timescale 1ns/1ps
module Priority_Encoder_4to2_tb;
reg [3:0]A;
wire [1:0]y;

Priority_Encoder_4to2 uut(
    .A(A),
    .y(y)
);

initial begin
    $monitor("A=%b'y=%b",A,y);
    A=4'b0000;
    #10;
    A=4'b0101;
    #10;
    A=4'b1010;
    #10;
    A=4'b1111;
    #10;
    A=4'b0011;
    #10;
    $finish;
end
endmodule