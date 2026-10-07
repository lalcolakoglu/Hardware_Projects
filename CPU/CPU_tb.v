module CPU_tb();
reg reset;
reg clock;
always #5 clock=~clock;
CPU uut(
    .reset(reset),
    .clock(clock)
);
initial begin
    clock=0; reset=1;
    $monitor("pc=%d, insstrution=%d",uut.pc.PC,uut.instruction);
    #10;
    reset=0;
    uut.datapath.File.registers[9] = 32'd42;
    uut.datapath.File.registers[10] = 32'd42;
    #60;
    $display("t0=%d, pc=%d",uut.datapath.File.registers[8],uut.pc.PC);
    $finish;
end
endmodule

