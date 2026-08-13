module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output [99:0] q); 
    
    reg [99:0] values;
    
    always @(posedge clk) begin
        if (load) begin
            values <= data;
        end else if (ena == 2'b01) begin
            values <= {values[0], values[99:1]};
        end else if (ena == 2'b10) begin
            values <= {values[98:0], values[99]};
        end
    end
    assign q = values;

endmodule
