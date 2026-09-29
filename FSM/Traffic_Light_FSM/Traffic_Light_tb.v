module Traffic_Light_tb();
reg clock;
reg reset;
wire red;
wire green;
wire yellow;
Traffic_Light uut(
    .clock(clock),
    .reset(reset),
    .red(red),
    .yellow(yellow),
    .green(green)
);
always #5 clock=~clock;
initial begin
    clock=0; reset=1;
    $monitor("clock=%b, reset=%b, state=%s red=%d, yellow=%d, green=%d\n",clock,reset,uut.state,red,yellow,green);
    #10;
    reset=0;
    #60;
    $finish;

end
endmodule