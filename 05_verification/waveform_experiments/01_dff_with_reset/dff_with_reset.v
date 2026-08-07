module dff_with_reset (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output reg [7:0] q
);
    always @(posedge clk) begin
        q[7:0] <= reset ? {8{1'b0}} : d[7:0];
    end

endmodule
