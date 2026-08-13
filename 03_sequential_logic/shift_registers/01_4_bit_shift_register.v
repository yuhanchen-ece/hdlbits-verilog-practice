module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 
    
    wire[3:0] current;
    always @(posedge clk or posedge areset) begin
        if (areset) begin
            current <= {4{1'b0}};
        end else if (load) begin
            current <= data;
        end else if (ena) begin
            current <= {1'b0, current[3:1]};
        end
    end
    assign q = current;

endmodule
