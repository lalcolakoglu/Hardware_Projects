module Half_Adder(
    input A,
    input B,
    output sum,
    output carry
);
// sum xor, cayy and   
assign carry=A &B;
assign sum=A^B;


endmodule
