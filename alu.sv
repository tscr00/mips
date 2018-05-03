`timescale 1ns / 1ps

module alu(
    input logic [31:0] alu_a,
    input logic [31:0] alu_b,
    output logic [31:0] alu_res,
    input logic [5:0] op
    );
    import constants::*;
    
    always_comb begin
        case(op)
            ALU_ADD: alu_res <= alu_a + alu_b;
            ALU_SUB: alu_res <= alu_a - alu_b;
            ALU_AND: alu_res <= alu_a & alu_b;
            ALU_OR:  alu_res <= alu_a | alu_b;
            ALU_XOR: alu_res <= alu_a ^ alu_b;
            ALU_NOR: alu_res <= !(alu_a | alu_b);
        endcase
    end;
endmodule
