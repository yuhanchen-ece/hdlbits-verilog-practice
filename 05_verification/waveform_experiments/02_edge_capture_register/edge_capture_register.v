module edge_capture_register (
    input clk,
    input reset,
    input [31:0] in,
    output reg [31:0] out
);
    reg[31:0] last;
    always @(posedge clk) begin
        if (~reset) begin
            out <= out | ~in & last;
        end else begin
            out <= {32{1'b0}};
        end
        last <= in;
    end
endmodule
    