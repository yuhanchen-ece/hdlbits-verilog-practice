module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] s1, s2;
    wire cout;
    add16 instance1 (.a(a[15:0]), .b(b[15:0]), .sum(s1), .cout(cout));
    add16 instance2 (.a(a[31:16]), .b(b[31:16]), .sum(s2), .cin(cout));
    assign sum = {s2[15:0], s1[15:0]};

endmodule
