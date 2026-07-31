module top_module (
    input [7:0] in,
    output [31:0] out );//

    assign out[31:8] = {25{in[7]}};
    assign out[7:0] = in[7:0];

endmodule
