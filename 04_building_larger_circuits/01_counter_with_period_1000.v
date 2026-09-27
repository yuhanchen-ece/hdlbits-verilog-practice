module top_module (
    input clk,
    input reset,
    output [9:0] q);

    reg[9:0] value;
    always @(posedge clk) begin
        if (reset) begin
            value <= 10'd0;
        end else begin 
            if (value == 10'd999) begin
                value <= 10'd0;
            end else begin
                value <= value + 10'd1;
            end
        end
    end
    
    assign q = value;

endmodule