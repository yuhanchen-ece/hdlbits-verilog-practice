module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);

    reg[1:0] count;
    always @(posedge clk) begin
        if (reset) begin
            count <= 2'b0;
            shift_ena <= 1'b1;
        end else if ((count > 2'b0 | shift_ena) & count != 2'b11) begin
            count <= count + 1'b1;
            shift_ena <= 1'b1;
        end else begin
            count <= 2'b0;
            shift_ena <= 1'b0;
        end
    end
endmodule