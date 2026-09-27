module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    
    parameter NO = 3'b0, SHIFT = 3'b10, COUNTING = 3'b11, DONE = 3'b100;
    reg[2:0] state;
    reg[3:0] values;
    reg[1:0] count;
    
    always @(posedge clk) begin
        if (reset) begin
            state <= NO;
            values <= 4'b0;
            count <= 2'b0;
        end else begin
            if (state == NO) begin
                values <= {values[2:0], data};
                if ({values[2:0], data} == 4'b1101) begin
                    state <= SHIFT;
                	count <= 2'b0;
                end
            end else if (state == SHIFT) begin
                if (count == 2'b11) begin
                    state <= COUNTING;
                end else begin
                    count <= count + 2'b1;
                end
            end else if (state == COUNTING) begin
                if (done_counting) begin
                    state <= DONE;
                end
            end else if (state == DONE & ack) begin
                state <= NO;
            	values <= 4'b0;
            	count <= 2'b0;
            end
        end
    end 
    
    always @(*) begin
        shift_ena = 1'b0;
        counting = 1'b0;
        done = 1'b0;
        if (state == SHIFT) begin
            shift_ena = 1'b1;
        end else if (state == COUNTING) begin
            counting = 1'b1;
        end else if (state == DONE) begin
            done = 1'b1;
        end 
    end

endmodule