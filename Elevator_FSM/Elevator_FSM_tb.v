module Elevator_FSM_tb();
reg clock;
reg reset;
reg [3:0]desired_floor;
wire moving_up;
wire moving_down;
wire door_open;

wire [3:0]current_floor;

Elevator_FSM uut(
    .clock(clock),
    .reset(reset),
    .desired_floor(desired_floor),
    .moving_down(moving_down),
    .moving_up(moving_up),
    .door_open(door_open),
    .current_floor(current_floor)
);

always #5 clock=~clock;
initial begin 
    clock=0; reset=1; desired_floor=4'b0001; 
    $monitor("desired floor=%d, current floor=%d, up=%d, down=%d, door=%d, time=%0t",desired_floor,current_floor,moving_up,moving_down,door_open,$time);
    #10;
    reset=0;
    desired_floor=4'b0100;
    #40;
    #10;
    desired_floor=4'b0001;
    #50;
    desired_floor=4'b0011;
    #40;
    desired_floor=4'b0011;
    #20;
    $finish;
end
endmodule