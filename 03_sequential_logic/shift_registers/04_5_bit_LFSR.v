module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output [4:0] q
); 
    wire[4:0] values;
    always @(posedge clk) begin
        if (reset) begin
            values <= 5'h1;
        end else begin
            values <= {values[0], values[4], values[3] ^ values[0], values[2:1]}; 
        end
    end
    assign q = values;

endmodule
