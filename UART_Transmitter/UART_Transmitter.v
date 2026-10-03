module UART_Transmitter (
    input [7:0] data,
    input start,
    input clock,
    input reset,
    output reg tx,
    output reg busy
);
reg [1:0]state;
reg [1:0] next_state;
reg [2:0] index;
reg [2:0] baud_count;
parameter clocks_per_bit=4;
parameter idle_state=2'b00;
parameter start_state=2'b01;
parameter data_state=2'b10;
parameter stop_state=2'b11;
always @(*) begin
    tx=0; busy=0; next_state=state;
    case (state)
    idle_state: begin
        tx=1; busy=0; 
        if (start==0)
            next_state=idle_state;
        else 
            next_state=start_state;

    end
    start_state: begin       
        tx=0; busy=1; 
        if (baud_count== clocks_per_bit-1) 
            next_state=data_state;
        
        else 
            next_state=start_state;
    end
   
    data_state: begin
       tx=data[index]; busy=1;

        if (baud_count==clocks_per_bit-1)
            if (index==7)
                next_state=stop_state;
            else
                next_state=data_state;
        else
            next_state=data_state;
            
    end
    stop_state: begin
        busy=1; tx=1;
        if (baud_count==clocks_per_bit-1) 
            next_state=idle_state;
        
        else 
            next_state=stop_state;

    end
    endcase
end

always @(posedge clock) begin
    if (reset) begin
        state<=idle_state;
        index<=0;
        baud_count<=0;
    end
    else begin
        state<=next_state;
        case (state)
        
        start_state: begin 
            
            if (baud_count== clocks_per_bit-1) begin
                baud_count<=0;
                index<=0;
            end
            else begin
                baud_count<=baud_count+1;
            end
        end
        data_state: begin
            if (baud_count==clocks_per_bit-1) begin
                index<=index+1;
                baud_count<=0;
            end
            else begin
                baud_count<=baud_count+1;
            end

        end
        stop_state: begin
            if (baud_count==clocks_per_bit-1) begin
                baud_count<=0;
                
            end
            else 
                baud_count<=baud_count+1;
        end
        
        
        endcase
    end
end
endmodule