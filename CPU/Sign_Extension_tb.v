`timescale 1ns/1ps
module Sign_Extension_tb();
reg  [15:0] immediate;
wire [31:0] extended;
Sign_Extension uut (
    .immediate(immediate),
    .extended(extended)
);
initial begin
    
    $monitor("immediate=%b, extended=%b",immediate,extended);
    #10;
    immediate=16'b1000000000000001;
    #10;
end
endmodule