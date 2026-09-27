module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);

    reg[3:0] current;
    always @(posedge clk) begin
        if (shift_ena) begin
            current <= {current[2:0], data};
        end else if (count_ena) begin
            current <= current - 1'b1;
        end
    end
    
    assign q = current;

endmodule
