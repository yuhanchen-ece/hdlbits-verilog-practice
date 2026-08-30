module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;

	localparam A = 0, B = 1;
    reg state, next_state;

    always @(posedge clk) begin
        if (reset) begin
            state <= B;
        end else begin
            state <= next_state;
        end
    end
    
    always @(*) begin
        if (state == A) begin
            next_state = in ? A : B;
        end else begin
            next_state = in ? B : A;
        end
    end
    
    assign out = (state == A) ? 1'b0 : 1'b1;
endmodule