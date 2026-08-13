module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output reg [3:0] q);
	
    always @(posedge clk) begin
        if (q == 4'd9 || reset) begin
            q <= {4{1'b0}};
        end else begin 
            q <= q + 1'b1;
        end
    end
endmodule
