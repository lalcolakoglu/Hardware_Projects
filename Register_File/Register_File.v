module Register_File(
    input clock,
    input reset,
    input write_enable,

    input [2:0] write_addr,   
    input [3:0] write_data,   

    input [2:0] read_addr1,
    input [2:0] read_addr2,

    output [3:0] read_data1,
    output [3:0] read_data2
);
reg [3:0] registers [0:7];

always @(posedge clock) begin
    if(reset) begin
        registers[0]<=4'b0000;
        registers[1]<=4'b0000;
        registers[2]<=4'b0000;
        registers[3]<=4'b0000;
        registers[4]<=4'b0000;
        registers[5]<=4'b0000;
        registers[6]<=4'b0000;
        registers[7]<=4'b0000;
    end
    else if (write_enable) begin
        registers[write_addr]<=write_data;
    end
end
assign read_data1=registers[read_addr1];
assign read_data2=registers[read_addr2];

endmodule