`timescale 1ns / 1ps


module top(
    input logic clk
    );
    
    mips mips(
        .clk(clk),
        .reset(0)
    );
endmodule
