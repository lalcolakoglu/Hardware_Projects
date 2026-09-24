`timescale 1ns/1ps
module Register_4bit_tb ();
reg [3:0] in;
reg clock;
reg reset;
wire [3:0] out;

Register_4bit uut(
    .in(in),
    .reset(reset),
    .out(out),
    .clock(clock)
);
always #5 clock= ~clock;
initial begin
    clock=0;
    $monitor("reset=%d,input=%d, clock=%d, output=%d", reset, in, clock,out);
    reset=1; in=4'b1010;
    #10;
    reset=0; in=4'b1010;
    #10;
    in=4'b0101; 
    #10;
    

    $finish;
end

    
endmodule