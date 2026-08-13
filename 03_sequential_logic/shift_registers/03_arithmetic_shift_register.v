module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output [63:0] q); 
	
    reg [63:0] values;
    always @(posedge clk) begin
        if (load) begin
            values <= data;
        end else if (ena) begin
            if (amount == 2'b00) begin
                values <= {values[62:0], 1'b0};
            end else if (amount == 2'b01) begin
                values <= {values[55:0], {8{1'b0}}};
            end else if (amount == 2'b10) begin
                values <= {values[63], values[63:1]};
            end else if (amount == 2'b11) begin
                values <= {{8{values[63]}}, values[63:8]};
            end
        end
    end
    assign q = values;
endmodule