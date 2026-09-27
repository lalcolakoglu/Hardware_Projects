module SU_Counter_4bit_tb();


reg clock;
reg reset;
wire [3:0] Qout;

SU_Counter_4bit uut(
    
    .Qout(Qout),
    .clock(clock),
    .reset(reset)
);

always #5 clock=~clock;
initial begin
    clock=0;
    reset=1;
    $monitor("clock=%b, reset=%b, Qout=%b",clock,reset,Qout);
    #10;
    reset=0; 
    #160;
   
    


    
    $finish;
end
endmodule