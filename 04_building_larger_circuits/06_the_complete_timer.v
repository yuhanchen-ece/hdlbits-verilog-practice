module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output reg [3:0] count,
    output reg counting,
    output reg done,
    input ack );
    
    parameter NO = 3'b0, SHIFT = 3'b10, COUNTING = 3'b11, DONE = 3'b100;
    reg[2:0] state;
    reg[3:0] values;
    reg[3:0] remaining;
    reg[9:0] kcount;
    reg[1:0] shift;
    
    always @(posedge clk) begin
        if (reset) begin
            state <= NO;
            values <= 4'b0;
            remaining <= 4'b0;
            kcount <= 10'b0;
            shift <= 2'b0;
        end else if (state == NO) begin
            values <= {values[2:0], data};
            if ({values[2:0], data} == 4'b1101) begin
                state <= SHIFT;
            end
        end else if (state == SHIFT) begin
            if (shift < 2'b11) begin
                shift <= shift + 1'b1;
                values <= {values[2:0], data};
            end else begin
                remaining <= {values[2:0], data};
                state <= COUNTING;
                shift <= 2'b0;
            end
        end else if (state == COUNTING) begin
          	kcount <= kcount + 1'b1;
            if (kcount == 10'd999) begin
                if (remaining == 4'b0) begin
                    state <= DONE;
                end else begin
                    remaining <= remaining - 1'b1;
                    kcount <= 10'b0;
                end
            end
        end else if (state == DONE) begin
            if (ack) begin
                state <= NO;
                remaining <= 4'b0;
                shift <= 2'b0;
                kcount <= 10'b0;
                values <= 4'b0;
            end
        end
    end
    
    always @(*) begin     
        count = 4'b0;
        counting = 1'b0;
        done = 1'b0;
        
        if (state == COUNTING) begin
            count = remaining;
            counting = 1'b1;
        end else if (state == DONE) begin
            done = 1'b1;
        end
    end
endmodule
