module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output reg [7:0] q
);
    always @(posedge clk) begin
        q[0] <= reset ? 0 : d[0];
        q[1] <= reset ? 0 : d[1];
        q[2] <= reset ? 0 : d[2];
        q[3] <= reset ? 0 : d[3];
        q[4] <= reset ? 0 : d[4];
        q[5] <= reset ? 0 : d[5];
        q[6] <= reset ? 0 : d[6];
        q[7] <= reset ? 0 : d[7];
    end

endmodule
