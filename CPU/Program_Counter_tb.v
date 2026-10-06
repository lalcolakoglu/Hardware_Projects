module Program_Counter_tb();
reg clock;
reg reset;
wire [31:0]PC;
always #5 clock=~clock;
Program_Counter uut(
    .clock(clock),
    .reset(reset),
    .PC(PC)
);
initial begin
    clock=0; reset=1;
    $monitor("time=%0t, reset=%d, PC=%d",$time,reset,PC);
    #10;
    reset=0;
    #30;
    $finish;
end
endmodule