module UART_Transmitter_tb ();
reg [7:0] data;
reg start;
reg clock;
reg reset;
wire tx;
wire busy;

UART_Transmitter uut(
    .data(data),
    .start(start),
    .clock(clock),
    .reset(reset),
    .tx(tx),
    .busy(busy)
);
always #5 clock=~clock;
initial begin 
    clock=0; reset=1; data=8'b00000000; start=0;
    $monitor("start=%b, data=%b, tx=%b, busy=%b, time=%0t",start,data,tx,busy,$time);
    #10;
    reset=0;
    data=8'b10110010; start=1;
    #10;
    start=0;
    #500;
   
   
    $finish;
end
endmodule