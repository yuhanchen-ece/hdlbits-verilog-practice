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

    localparam R = 0, L = 1, F = 2, D = 3, DEAD = 4;
    reg[2:0] state, next_state;
    reg last;
    reg[11:0] fall;
    
    always @(posedge clk or posedge areset) begin
    	if (areset) begin
        	state <= L;
            last <= L;
            fall <= 12'b0;
      	end else begin
            state <= next_state;
            if (state < F) begin
                last <= state;
            end
            if (state != F) begin
                fall <= 12'b0;
            end else begin
                fall <= fall + 1'b1;
            end
        end
    end
    
    always @(*) begin
        next_state = state;
        if (state == DEAD) begin
            next_state = DEAD;
        end else if (~ground) begin
            next_state = F;
        end else if (state == F & fall > 11'd19) begin
            next_state = DEAD;
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
    
    
    assign walk_left = (state == DEAD) ? 1'b0 : (state == L);
    assign walk_right = (state == DEAD) ? 1'b0 : (state == R);
    assign aaah = (state == DEAD) ? 1'b0 : (state == F);
    assign digging = (state == DEAD) ? 1'b0 : (state == D);
    
endmodule
