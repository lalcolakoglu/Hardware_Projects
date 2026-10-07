module Data_Memory(
    input reset,
    input clock,
    input [31:0]address,
    input read,
    input write,
    input [31:0]write_data,
    output [31:0] read_data

);
reg [31:0] memory [0:255];

assign read_data=read? memory[address[9:2]]: 32'b0;;
always@(posedge clock) begin
   
    if(write)
        memory[address[9:2]]<=write_data;
end


endmodule

