module Register_File(
    input clock,
    input reset,
    input RegWrite,
    input [4:0] read_addr1,
    input [4:0] read_addr2,
    input [4:0] write_addr,
    input [31:0] write_data,
    output [31:0] read_data1,
    output [31:0] read_data2


);
reg [31:0] registers [0:31];
integer i;
always @(posedge clock) begin
    
    if (reset) begin
        for(i=0; i<32;i++)
            registers[i]<=32'b0;
    end
    else if (RegWrite)
        registers[write_addr]<=write_data;
end
assign read_data1=registers[read_addr1];
assign read_data2=registers[read_addr2];
endmodule

