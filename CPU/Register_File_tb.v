module Register_File_tb();
reg clock;
reg reset;
reg RegWrite;
reg [4:0] read_addr1;
reg [4:0] read_addr2;
reg [4:0] write_addr;
reg [31:0] write_data;
wire [31:0] read_data1;
wire [31:0] read_data2;
Register_File uut(
    .clock(clock),
    .reset(reset),
    .RegWrite(RegWrite),
    .read_addr1(read_addr1),
    .read_addr2(read_addr2),
    .write_addr(write_addr),
    .write_data(write_data),
    .read_data1(read_data1),
    .read_data2(read_data2)
);
always #5 clock=~clock;
initial begin
    clock=0; reset=1; RegWrite=0;
    $monitor("write_addr=%b, write_data=%b, read addr1=%b, read data1=%b, read addr2=%b ,read data2=%b, clock=%b,reset=%b, write enable=%b",
    write_addr,write_data,read_addr1,read_data1,read_addr2,read_data2,clock,reset,RegWrite);
    #10;
    reset=0; RegWrite=1;
    write_addr = 5'd5;
    write_data = 32'd100;   
    #10;
    write_addr=5'd3;
    write_data=32'd832764;
    #10;
    read_addr1=5'd5;
    read_addr2=5'd3;
    RegWrite=0;
    #10;
    write_addr=5'd6;
    write_data=32'd456;
    #10;
    read_addr1=5'd6;
    #10;
    $finish;
end
endmodule