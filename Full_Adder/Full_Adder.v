// i used the half adder i wrote before
module Full_Adder(
    input A,
    input B,
    input C,
    output carry1,
    output carry2,
    output carry_out,
    output sum1,
    output sum2
);

Half_Adder HA1(
    .A(A),
    .B(B),
    .sum(sum1),
    .carry(carry1)
);

Half_Adder HA2(
    .A(C),
    .B(sum1),
    .sum(sum2),
    .carry(carry2)
);
or_gate OR(
    .a(carry2),
    .b(carry1),
    .c(carry_out)
);
// assign carry_out=carry2^carry1;
endmodule
