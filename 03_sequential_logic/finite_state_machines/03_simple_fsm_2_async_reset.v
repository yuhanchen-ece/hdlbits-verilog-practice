module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); 

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        if (state == ON) begin
            next_state = (k == 0) ? ON : OFF;
        end else begin
            next_state = (j == 0) ? OFF : ON;
        end
    end

    always @(posedge clk, posedge areset) begin
        if (areset) begin
            state <= OFF;
        end else begin
            state <= next_state;
        end
    end

    assign out = (state == ON) ? 1'b1 : 1'b0;

endmodule
