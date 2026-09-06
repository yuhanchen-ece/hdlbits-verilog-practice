module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 

    localparam R = 0, L = 1, F = 2, D = 3;
    reg[1:0] state, next_state;
    reg last;
    
    always @(posedge clk or posedge areset) begin
    	if (areset) begin
        	state <= L;
            last <= L;
      	end else begin
            state <= next_state;
            if (state == D) begin
            end else begin
                if (state < F) begin
                    last <= state;
                end
            end
        end
    end
    
    always @(*) begin
        next_state = state;
        if (~ground) begin
            next_state = F;
        end else if (state == F) begin
            next_state = last;
        end else if (dig | (state == D)) begin
            next_state = D;
        end else if (bump_left & bump_right) begin
            next_state = (state == R) ? L : R;
        end else if (bump_left) begin
            next_state = R;
        end else if (bump_right) begin
            next_state = L;
        end else begin
            next_state = state;
        end
    end
    
    
    assign walk_left = (state == L);
    assign walk_right = (state == R);
    assign aaah = (state == F);
    assign digging = (state == D);
    
endmodule
