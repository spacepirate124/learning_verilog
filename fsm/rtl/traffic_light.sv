module traffic_light (
    input logic clk,
    input logic rst,
    output logic r, y, g
);

typedef enum logic [1:0] {
    GREEN = 2'b00,
    YELLOW = 2'b01,
    RED = 2'b10
} state_t;

state_t state, next_state;
logic [2:0] counter;

always_ff @(posedge clk) begin
    if (rst) begin
        state <= GREEN;
        counter <= 0;
    end
    else begin
        state <= next_state;
        if (next_state != state) counter <= 0;
        else counter <= counter + 1;
    end
end

// compute next_state
always_comb begin
    case (state)
        GREEN: begin
            if (counter >= 4) next_state = YELLOW;
            else next_state = GREEN;
        end
        YELLOW: begin
            if (counter >= 1) next_state = RED;
            else next_state = YELLOW;
        end
        RED: begin 
            if (counter >= 4) next_state = GREEN;
            else next_state = RED;
        end
        default: next_state = GREEN;
    endcase
end

// assign state
always_comb begin
    case (state) 
        GREEN: begin g = 1; y = 0; r = 0; end
        YELLOW: begin g = 0; y = 1; r = 0; end
        RED: begin g = 0; y = 0; r = 1; end
        default: begin g = 0; y = 0; r = 0; end
    endcase
end
endmodule