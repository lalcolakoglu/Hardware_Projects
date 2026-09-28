module Register_File_tb();
reg clock;
reg reset;
reg write_enable;
reg [2:0] write_addr;
reg [3:0] write_data;
reg [2:0] read_addr1;
reg [2:0] read_addr2;   
wire [3:0] read_data1;
wire [3:0] read_data2;    


Register_File uut(
    .clock(clock),
    .reset(reset),
    .write_enable(write_enable),
    .write_addr(write_addr),
    .write_data(write_data),
    .read_data1(read_data1),
    .read_data2(read_data2),
    .read_addr1(read_addr1),
    .read_addr2(read_addr2)
);
always #5 clock=~clock;
initial begin
    reset=1; clock=0; write_enable=0;
    write_addr=3'b000; write_data=4'b0000; read_addr1=3'b000; read_addr2=3'b000;
    $monitor("write_addr=%b, write_data=%b, read addr1=%b, read data1=%b, read addr2=%b ,read data2=%b, clock=%b,reset=%b, write enable=%b",
    write_addr,write_data,read_addr1,read_data1,read_addr2,read_data2,clock,reset,write_enable);
    #10;
    reset=0; write_enable=1;
    write_addr=3'b010;   //address of the register
    write_data=4'b1010;  //data of the register 010
    #10;
    write_addr=3'b101;
    write_data=4'b0110;
    #10;
    read_addr1=3'b010;
    read_addr2=3'b101;
    write_enable=0;
    #10;
    write_addr=3'b010;
    write_data=4'b0111;
    #10;
    read_addr1=3'b010;
    #10;
    

    $finish;
end
endmodule