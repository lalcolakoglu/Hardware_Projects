module Data_Memory_tb();
reg reset;
reg clock;
reg [31:0]address;
reg read;
reg write;
reg [31:0]write_data;
wire [31:0] read_data;
Data_Memory uut(
    .reset(reset),
    .clock(clock),
    .address(address),
    .read(read),
    .write(write),
    .write_data(write_data),
    .read_data(read_data)
);
always #5 clock=~clock;
initial begin
    clock=0; reset=1; write=0; read=0;
    $monitor("reset=%d, clock=%d, read=%d, write=%d, address=%d, write data=%d, read data=%d",
    reset,clock,read,write,address,write_data,read_data);
    #10;
    reset=0;
    #10;
    write=1;
    address=32'd4;
    write_data=32'd1234;
    #10;
    write=0; read=1;
    #10;
    read=0;
    #10;
    $finish;

end
endmodule