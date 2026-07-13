module Encode_4to2_if(
    input [3:0] A,
    output reg [1:0] y
);

always @(*) begin
    if (A==4'b0001)
        y=2'b00;
    else if(A==4'b0010)
        y=2'b01;
    else if(A==4'b0100)
        y=2'b10;
    else if(A==4'b1000)
        y=2'b11;
    else
        y=2'b00;
    
        
end
endmodule
