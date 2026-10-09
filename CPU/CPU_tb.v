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
    uut.datapath.data_memory.memory[1] = 32'd42;
    uut.datapath.File.registers[9] = 32'd30; //t1
    
    uut.memory.memory[0] = 32'h8C080004; //lw
    uut.memory.memory[1] = 32'h11090001; //beq
    
    #17;
    $display("DEBUG: time=%0t, PC=%0d", $time, uut.pc.PC);
    if (uut.datapath.File.registers[8] == 32'd42)
        $display("LW: PASS");
    else
        $display("LW: FAIL");


    if (uut.pc.PC == 32'd8)
        $display("BEQ not taken: PASS");
    else
        $display("BEQ not taken: FAIL, PC=%d",uut.pc.PC);


    reset=1;
    #20;
    
    uut.datapath.File.registers[8] = 32'd42; //t0
    uut.datapath.File.registers[9] = 32'd42; //t1
    uut.memory.memory[1]=32'h11090001;  //beq
    reset=0;
    
    #27;
    $display("DEBUG: time=%0t, PC=%0d", $time, uut.pc.PC);
    if (uut.pc.PC == 32'd12)
        $display("BEQ taken: PASS");
    else
        $display("BEQ taken: FAIL, PC=%d",uut.pc.PC);
   
    $finish;
end
endmodule

