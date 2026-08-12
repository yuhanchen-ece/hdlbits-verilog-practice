`timescale 1ns/1ps

module four_bit_binary_counter_tb;
    reg clk;
    reg reset;
    wire [3:0] q;

    four_bit_binary_counter DUT (.clk(clk), .reset(reset), .q(q));

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("four_bit_binary_counter.vcd");
        $dumpvars(0, four_bit_binary_counter_tb);
    end

    initial begin
        reset = 1'b1;
        @(posedge clk);
        #1;

        @(negedge clk);
        reset = 1'b0;

        repeat (5) begin
            @(posedge clk);
            #1;
        end

        @(negedge clk);
        reset = 1'b1;
        @(posedge clk);
        #1;

        @(negedge clk);
        reset = 1'b0;
        repeat (17) begin
            @(posedge clk);
            #1;
        end

        @(negedge clk);
        reset = 1'b1;
        @(posedge clk);
        #1;
        @(posedge clk);
        #1;

        $finish;
    end
endmodule