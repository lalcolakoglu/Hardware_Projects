//4to1 mux with always case
module MUX_4to1_ac (
    input [3:0] in1,
    input [3:0]in2,
    input [3:0]in3,
    input [3:0]in4,
    input [1:0]sel,
    output reg [3:0]y


);
always @(*) begin
    case(sel)
        2'b00: y=in1;
        2'b01: y=in2;
        2'b10: y=in3;
        2'b11: y=in4;
    endcase
end


endmodule
