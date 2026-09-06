module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); 

    localparam R = 0, L = 1;
    reg state, next_state;
    
    always @(posedge clk or posedge areset) begin
    	if (areset) begin
        	state <= L;
      	end else begin
            state <= next_state;
        end
    end
    
    always @(*) begin
        next_state = state;
    	if (bump_left & bump_right) begin
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

    
endmodule
