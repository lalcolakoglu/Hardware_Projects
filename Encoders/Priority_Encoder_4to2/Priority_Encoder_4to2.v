//prority: A3>A2>A1>A0
module Priority_Encoder_4to2 (
  input [3:0] A,
  output reg [1:0] y  
);

always @(*) begin
    if(A[3])
        y=2'b11;
    else if(A[2])
        y=2'b10;
    else if(A[1])
        y=2'b01;
    else if(A[0])
        y=2'b00;
    else
        y=2'b00;
end
endmodule
