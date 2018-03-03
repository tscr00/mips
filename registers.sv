`timescale 1ns / 1ps


module register_file(
    input logic clk,
    input logic [4:0] reg_1, reg_2, reg_w,
    input logic reg_write_en,
    input logic [31:0] reg_write_data,
    output logic [31:0] reg_out_1, reg_out_2
    );
    
    // actual registers definition
    logic [31:0] registers [0:31];
  
    always_ff @(posedge clk) begin
        if (reg_write_en) begin
            registers[reg_w] <= reg_write_data;
        end;
    end;
    
    // $0 is hardcoded to 0
    assign reg_out_1 = |reg_1 == 0 ? 0 : registers[reg_1];
    assign reg_out_2 = |reg_2 == 0 ? 0 : registers[reg_2];
endmodule
