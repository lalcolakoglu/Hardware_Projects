module Traffic_Light (
    input clock,
    input reset,
    output reg red,
    output reg green,
    output reg yellow

);
reg [47:0] state;
reg [47:0] next_state;
always @(*) begin
    
    
    case(state)
        "RED": next_state="YELLOW";
        "YELLOW": next_state="GREEN";
        "GREEN": next_state="RED";
    endcase
    
end
always @(*) begin
    
    case(state) 
        "RED": begin red=1; yellow=0; green=0; end
        "YELLOW": begin red=0; yellow=1; green=0; end
        "GREEN": begin red=0; yellow=0; green=1; end
        
    endcase
   
    
end
always @(posedge clock) begin
    if (reset)
        state<="RED"; 
    else 
        state<=next_state;
end
endmodule