module Parameterized_Comparator #(parameter width=4)(
    input [width-1:0]A,
    input [width-1:0]B,
    output reg greater,
    output reg equal,
    output reg less
);
always @(*) begin
    if (A==B) begin
        equal=1; greater=0; less=0;
    end
    else if (A<B) begin
        equal=0; greater=0; less=1;
    end
    else  begin
        equal=0; greater=1; less=0;
    end

end
endmodule