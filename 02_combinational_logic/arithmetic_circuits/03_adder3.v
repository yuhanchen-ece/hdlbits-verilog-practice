module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
	
    wire c1, c2, c3, s1, s2, s3;
    full_adder one (.a(a[0]), .b(b[0]), .cin(cin), .cout(cout[0]), .sum(s1));
    full_adder two (.a(a[1]), .b(b[1]), .cin(cout[0]), .cout(cout[1]), .sum(s2));
    full_adder three (.a(a[2]), .b(b[2]), .cin(cout[1]), .cout(cout[2]), .sum(s3));
    assign sum = {s3, s2, s1};
endmodule

module full_adder( 
    input a, b, cin,
    output cout, sum );
	
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule
