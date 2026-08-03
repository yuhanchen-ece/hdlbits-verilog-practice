module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire c1, c2, c3, c4;
    wire s1, s2, s3, s4;
    adder one (.a(x[0]), .b(y[0]), .cin(1'b0), .cout(c1), .sum(s1));
    adder two (.a(x[1]), .b(y[1]), .cin(c1), .cout(c2), .sum(s2));
    adder three (.a(x[2]), .b(y[2]), .cin(c2), .cout(c3), .sum(s3));
    adder four (.a(x[3]), .b(y[3]), .cin(c3), .cout(c4), .sum(s4));
    assign sum = {c4, s4, s3, s2, s1};

endmodule

module adder( 
    input a, b, cin,
    output cout, sum );
	
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule
