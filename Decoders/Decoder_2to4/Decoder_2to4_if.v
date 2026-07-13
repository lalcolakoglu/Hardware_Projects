module Decoder_2to4_if(
    input [1:0]A,
    output reg [3:0]y
);

always @(*) begin
    if(A==2'b00)
        y=4'b0001;
    else if(A==2'b01)
        y=4'b0010;
    else if(A==2'b10)
        y=4'b0100;
    else
        y=4'b1000;
end

endmodule
