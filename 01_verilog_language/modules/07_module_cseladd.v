module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] s1, s2, s3;
    wire cout;
    wire [15:0] multiplexer;
    add16 instance1 (.a(a[15:0]), .b(b[15:0]), .sum(s1), .cout(cout));
    add16 instance2 (.a(a[31:16]), .b(b[31:16]), .sum(s2), .cin(1'b1)); //Using a multiplexer by assuming carry is 0 or 1
    add16 instance3 (.a(a[31:16]), .b(b[31:16]), .sum(s3), .cin(1'b0));
    assign multiplexer = cout ? s2 : s3; //Ternary operator is simplest method
    assign sum = {multiplexer, s1[15:0]};

endmodule
