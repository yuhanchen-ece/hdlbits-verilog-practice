`timescale 1ns/1ps

module dff_with_reset_tb;
    reg clk;
    reg reset;
    reg[7:0] d;
    wire[7:0] q;

    dff_with_reset instance1 (.clk(clk), .reset(reset), .d(d[7:0]), .q(q[7:0]));

    // Create a VCD file for GTKWave.
    initial begin
        $dumpfile("dff_with_reset.vcd");
        $dumpvars(0, dff_with_reset_tb);
    end

    // Generate a clock with a 10 ns period.
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    // Apply test inputs
    initial begin
        reset = 1'b1;
        d     = 8'hA5;

        #12 reset = 1'b0;
        #10 d     = 8'h3C;
        #10 begin
            reset = 1'b1;
            d     = 8'hF0;
        end
        #10 d     = 8'h0F;
        #10 reset = 1'b0;
        #10 d     = 8'h96;

        #18 $finish;
    end

    // Print signal changes in the terminal.
    initial begin
        $monitor("time=%0t  clk=%b  reset=%b  d=%h  q=%h",
                 $time, clk, reset, d, q);
    end
endmodule