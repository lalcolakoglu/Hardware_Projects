module ALU_4bit(
    input [3:0]A,
    input [3:0]B,
    input [1:0] operation,
    output reg [3:0] result,
    output reg carry_out
    
);

wire [3:0] add_result;
wire add_carry;
wire [3:0] sub_result;
wire sub_carry;
Ripple_Carry_Adder_4bit add(
    .A(A),
    .B(B),
    .Cin(0),
    .carry_out(add_carry),
    .sum(add_result)
);

Ripple_Carry_Adder_4bit sub(
    .A(A),
    .B(~B),
    .Cin(1),
    .carry_out(sub_carry),
    .sum(sub_result)
);

always @(*) begin
    case(operation)
        2'b00: begin
            result=add_result;
            carry_out=add_carry;
        end
        2'b01: begin
            result=sub_result;
            carry_out=sub_carry;
        end
        2'b10: begin
            result=A&B;
            carry_out=0;
        end
        2'b11: begin
            result=A|B;
            carry_out=0;
        end
        default:begin
            result=4'b0000;
            carry_out=0;
        end
    endcase
end
endmodule