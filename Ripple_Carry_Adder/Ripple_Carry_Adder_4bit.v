//i will use 4 full adders
//ripple carry = fa0s cout is fa1s carry
module Ripple_Carry_Adder_4bit(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] sum,
    output carry1,
    output carry2,
    output carry3,
    output carry_out
    
);
Full_Adder FA1(
    .A(A[0]),
    .B(B[0]),
    .C(Cin),
    .carry_out(carry1),
    .sum2(sum[0])

);
Full_Adder FA2(
    .A(A[1]),
    .B(B[1]),
    .C(carry1),
    .carry_out(carry2),
    .sum2(sum[1])
);
Full_Adder FA3(
    .A(A[2]),
    .B(B[2]),
    .C(carry2),
    .carry_out(carry3),
    .sum2(sum[2])
);
Full_Adder FA4(
    .A(A[3]),
    .B(B[3]),
    .C(carry3),
    .carry_out(carry_out),
    .sum2(sum[3])
);
endmodule