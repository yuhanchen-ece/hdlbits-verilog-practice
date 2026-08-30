module top_module(
    input clk,
    input in,
    input areset,
    output out);

    parameter A=2'b00, B=2'b01, C=2'b10, D=2'b11;
    reg[1:0] state, next_state;

    always @(*) begin
        next_state = state;
        case (state) 
            A: next_state = in ? B : A;
            B: next_state = in ? B : C;
            C: next_state = in ? D : A;
            D: next_state = in ? B : C;
        endcase
    end
    
    always @(posedge clk or posedge areset) begin
        if (areset) begin
            state <= A;
        end else begin
            state <= next_state;
        end 
    end
    
    assign out = (state == D) ? 1'b1 : 1'b0;

endmodule
