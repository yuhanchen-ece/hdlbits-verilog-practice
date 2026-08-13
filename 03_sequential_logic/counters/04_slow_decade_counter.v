module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    input slowena,
    output reg [3:0] q);
	
    always @(posedge clk) begin
        if (reset || (q == 4'd9 && slowena)) begin
            q <= {4{1'b0}};
        end else begin 
            q <= slowena ? q + 1'b1 : q;
        end
    end
endmodule
