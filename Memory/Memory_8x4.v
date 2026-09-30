module Memory_8x4 (
    input write_enable,
    input clock,
    input reset,
    input [2:0] write_addr,
    input [3:0] write_data,
    input [2:0] read_addr,
    output [3:0] read_data
    
);
reg [3:0] memory [7:0];
always @(posedge clock) begin
    if (reset) begin
        memory[0]<=4'b0000;
        memory[1]<=4'b0000;
        memory[2]<=4'b0000;
        memory[3]<=4'b0000;
        memory[4]<=4'b0000;
        memory[5]<=4'b0000;
        memory[6]<=4'b0000;
        memory[7]<=4'b0000;
    end
    else if(write_enable) begin
        memory[write_addr]<=write_data;
    end
end
assign read_data=memory[read_addr];

endmodule