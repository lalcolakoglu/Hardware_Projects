module Program_Counter_tb();
reg clock;
reg reset;
reg [31:0] next;
wire [31:0]PC;
always #5 clock=~clock;
Program_Counter uut(
    .clock(clock),
    .reset(reset),
    .PC(PC),
    .next(next)
);
initial begin
    clock=0; reset=1;
    $monitor("time=%0t, reset=%d, PC=%d, next=%d",$time,reset,PC,next);
    #10;
    reset=0;
    next=32'd4;
    #10;
    next=32'd8;
    #10;
    $finish;
end
endmodule