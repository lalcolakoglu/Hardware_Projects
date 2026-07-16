module Priority_Encoder_4to2 (
  input [3:0] A,
  output reg [1:0] y  
);

always @(*) begin
    if(A[3]==1)
        y=11;
    else if(A[2]==1)
        y=10;
    else if(A[1]==1)
        y=01;
    else if(A[0]==1)
        y=00;
    else
        y=00;
end
endmodule
