module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    reg[3:1] last_s;
    reg[3:1] last_dfr;

    always @(posedge clk) begin
        if (reset) begin
            dfr <= 1'b1;
            fr1 <= 1'b1;
            fr2 <= 1'b1;
            fr3 <= 1'b1;
            last_s = 3'b000;
        end else begin
            fr1 <= ~s[3];
            fr2 <= ~s[2];
            fr3 <= ~s[1];
            
            if (last_s > s) begin
                dfr <= 1'b1;
            end else if (s > last_s) begin
                dfr <= 1'b0;
            end 
            
            last_s <= s;
            last_dfr <= dfr;
        end
    end
    
endmodule