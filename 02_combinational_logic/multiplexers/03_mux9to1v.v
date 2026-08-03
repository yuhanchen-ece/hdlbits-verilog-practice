module top_module( 
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output [15:0] out );
    
    always @(*) begin
        case (sel[3:0])
            4'd0: out[15:0] = a[15:0];
            4'd1: out[15:0] = b[15:0];
            4'd2: out[15:0] = c[15:0];
            4'd3: out[15:0] = d[15:0];
            4'd4: out[15:0] = e[15:0];
            4'd5: out[15:0] = f[15:0];
            4'd6: out[15:0] = g[15:0];
            4'd7: out[15:0] = h[15:0];
            4'd8: out[15:0] = i[15:0];
            default: out[15:0] = {16{1'b1}};
        endcase
    end
          
endmodule
