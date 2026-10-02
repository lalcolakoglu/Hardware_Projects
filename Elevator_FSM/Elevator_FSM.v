module Elevator_FSM (
    input clock,
    input reset,
    input [3:0]desired_floor,
    output reg moving_up,
    output reg moving_down,
    output reg door_open,
    output reg [3:0] current_floor
);
//output reg [3:0] current_floor;


reg [1:0] state;
reg [1:0] next_state;
parameter idle_state= 2'b00;
parameter moving_up_state = 2'b01;
parameter moving_down_state = 2'b10;
parameter door_open_state = 2'b11;

always @(*) begin
    moving_up=0; moving_down=0; door_open=0; next_state=state;
    case(state)

    idle_state: begin
        
        if (desired_floor==current_floor)
            next_state=door_open_state;
        else if (desired_floor<current_floor)
            next_state=moving_down_state;
        else if (desired_floor>current_floor)
            next_state=moving_up_state;
    end
    moving_up_state: begin
        moving_up=1; 
        if (desired_floor==current_floor+1)
            next_state=door_open_state;
        else if (desired_floor==current_floor)
            next_state=door_open_state;
        else
            next_state=moving_up_state;
        
    end
    moving_down_state: begin
        moving_down=1; 
        if (desired_floor==current_floor-1)
            next_state=door_open_state;
        else if (desired_floor==current_floor)
            next_state=door_open_state;
        else 
            next_state=moving_down_state;
    end
    door_open_state: begin
        door_open=1; 
        if (desired_floor==current_floor)
            next_state=door_open_state;
        else if (desired_floor<current_floor)
            next_state=moving_down_state;
        else if (desired_floor>current_floor)
            next_state=moving_up_state;
    end
    endcase
end

always @(posedge clock) begin
    if (reset) begin
        state<=idle_state;
        current_floor<=1; 
    end
    else begin
        state<=next_state;
        case (state)
        idle_state: current_floor<=current_floor;
        moving_down_state: current_floor<=current_floor-1;
        moving_up_state: current_floor<=current_floor+1;
        door_open_state: current_floor<=current_floor;
        endcase
        
    end
end
endmodule