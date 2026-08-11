module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //

    wire[3:0] q1, q2, q3;
    assign c_enable[2:0] = {((q2 == 4'd9) && (q1 == 4'd9)), q1 == 4'd9, 1'b1};
    
    bcdcount one (.clk(clk), .reset(reset), .enable(c_enable[0]), .Q(q1));
    bcdcount two (.clk(clk), .reset(reset), .enable(c_enable[1]), .Q(q2));
    bcdcount three (.clk(clk), .reset(reset), .enable(c_enable[2]), .Q(q3));
    
    assign OneHertz = (q1 == 4'd9) && (q2 == 4'd9) && (q3 == 4'd9);

endmodule
