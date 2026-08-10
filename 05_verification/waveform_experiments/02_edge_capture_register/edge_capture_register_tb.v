`timescale 1ns/1ps

module edge_capture_register_tb;
    reg clk;
    reg reset;
    reg[31:0] in;
    wire[31:0] out;

    edge_capture_register DUT (.clk(clk), .reset(reset), .in(in), .out(out));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        in = {32{1'b0}};
        reset = 1'b0;
        #14 in[31:16] = {16{1'b1}};
        #5 reset = 1'b1;
        #10 in[15:0] = {16{1'b1}};
        reset = 1'b0;
        #17 in = {32{1'b0}};
        @(posedge clk);
        #1;
        @(posedge clk);
        #1;
        @(negedge clk);
        reset = 1'b1;
        @(posedge clk);
        #1;
        @(negedge clk);
        reset = 1'b0;
        in = 32'h0000_00FF;
        @(posedge clk);
        #1;
        @(negedge clk);
        in = 32'h0000_000F;
        @(posedge clk);
        #1;

        @(negedge clk);
        in = 32'h0000_F00F;
        @(posedge clk);
        #1;
        @(negedge clk);
        in = 32'h0000_000F;
        @(posedge clk);
        #1;
        @(negedge clk);
        reset = 1'b1;
        @(posedge clk);
        #1;
        @(posedge clk);
        #1;
        $finish;
    end
    initial begin
        $dumpfile("edge_capture_register.vcd");
        $dumpvars(0, edge_capture_register_tb);
    end
endmodule