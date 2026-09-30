module Memory_8x4_tb();
reg write_enable;
reg clock;
reg reset;
reg [2:0] write_addr;
reg [3:0] write_data;
reg [2:0] read_addr;
wire [3:0] read_data;
Memory_8x4 uut(
    .clock(clock),
    .reset(reset),
    .write_enable(write_enable),
    .write_addr(write_addr),
    .write_data(write_data),
    .read_data(read_data),
    .read_addr(read_addr)
);
always #5 clock=~clock;
initial begin
    reset=1; clock=0; write_enable=0; write_addr=3'b000; write_data=4'b0000; read_addr=3'b000;
    $monitor("clock=%d, reset=%d, write_enable=%d, write_addr=%b, write_data=%b, read_addr=%b, read_data=%b",clock,reset,write_enable,
    write_addr,write_data,read_addr,read_data);
    #5;
    reset=0; write_enable=1;
    write_addr=3'b101;
    write_data=4'b0011;
    #5;
    read_addr=3'b101;
    #5;
    write_addr=3'b010;
    write_data=4'b1010;
    #5;
    read_addr=3'b010;
    #5;

    write_addr=3'b111;
    write_data=4'b0110;
    #5;
    read_addr=3'b111;
    #5;

    $finish;
end
endmodule