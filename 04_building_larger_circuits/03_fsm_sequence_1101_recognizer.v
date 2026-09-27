module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    
    parameter NO = 1'b0, YES = 1'b1;
    reg state;
    reg[3:0] values;
    
    always @(posedge clk) begin
        if (reset) begin
            state <= NO;
            values <= 4'b0;
        end else begin
            values <= {values[2:0], data};
            if ({values[2:0], data} == 4'b1101 | state) begin
                state <= YES;
            end else begin
                state <= NO;
            end
        end
    end
    
    assign start_shifting = state;

endmodule
