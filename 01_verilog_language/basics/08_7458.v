module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
	
    wire one;
    wire two;
    wire three;
    wire four;
    
    assign one = p2c & p2d;
    assign two = (p1f & p1e) & p1d;
    assign three = p2a & p2b;
    assign four = (p1a & p1b) & p1c;
    
    assign p2y = one | three;
    assign p1y = two | four;

endmodule
