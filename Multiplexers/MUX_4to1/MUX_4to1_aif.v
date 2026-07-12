//4to1 mux with always if else statements
module MUX_4to1_aif(
    input [3:0]in1,
    input [3:0]in2,
    input [3:0]in3,
    input [3:0]in4,
    input [1:0]sel,
    output reg [3:0] y
);
 always @(*) begin
    if(sel==2'b00)
        y=in1;
    else if(sel==2'b01)
        y=in2;
    else if (sel==2'b10)
        y=in3;
    else
        y=in4;
 end


endmodule