
module MUX_8to1_tb;
reg [3:0] in0;
reg [3:0] in1;
reg [3:0] in2;
reg [3:0] in3;
reg[3:0] in4;
reg[3:0] in5;
reg [3:0] in6;
reg [3:0] in7;
reg [2:0] sel;
wire [3:0] y;

MUX_8to1 uut(
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .in5(in5),
    .in6(in6),
    .in7(in7),
    .sel(sel),
    .y(y)

);
initial begin
    $monitor("in0=%b,in1=%b,in2=%b,in3=%b \n in4=%b,in5=%b,in6=%b,in7=%b,sel=%b,y=%b",in0,in1,in2,in3,in4,in5,in6,in7,sel,y);
    in0=4'b0000;
    in1=4'b0001;
    in2=4'b0010;
    in3=4'b0011;
    in4=4'b0100;
    in5=4'b0101;
    in6=4'b0110;
    in7=4'b0111;
    sel=3'b000;
    #10;
    sel=3'b001;
    #10;
    sel=3'b010;
    #10;
    sel=3'b011;
    #10;
    sel=3'b100;
    #10;
    sel=3'b101;
    #10;
    sel=3'b110;
    #10;
    sel=3'b111;
    #10;
    $finish;

    

end


endmodule
