module top_module ( input clk, input d, output q );
    wire q1, q2, q3;

    my_dff one(.q(q1), .clk(clk), .d(d));

    my_dff two(.q(q2), .clk(clk), .d(q1));

    my_dff three(.q(q), .clk(clk), .d(q2));
    
endmodule
