`timescale 1ns / 1ps


module static_data_memory(
    input logic clk,
    input logic [31:0] pc,
    output logic [31:0] instr
    );
    
    // initialize a static array of 1024 bytes (for testing)
    logic [31:0] data [0:1023];
endmodule
