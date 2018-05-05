`timescale 1ns / 1ps


module mips(
    input logic clk,
    input logic reset
    );
    
    // program counter
    logic [31:0] pc, pc4, instr;
    
    // registers
    logic [31:0] reg_out_1, reg_out_2;
    logic [31:0] reg_w;
    
    // alu
    logic [5:0] alu_op;
    logic [31:0] alu_res;
    logic [31:0] alu_b;
    
    // control logic
    logic [5:0] opcode;
    logic reg_write_en;
    
    // sign-extended immediate
    logic [31:0] imm;
    
    initial begin
        pc <= 32'b0;
    end
    
    // next program counter (better reuse ALU after pipeline implemented)
    assign pc4 = pc + 4;

    assign pc_branch = alu_res;
    
    always @(posedge clk) begin
        pc <= pc4;
    end
    
    
    static_instruction_memory instr_mem(
        .clk(clk),
        .pc(pc),
        .instr(instr)
    );
    
    control_unit cu(
        .instr(instr),
        .alu_b(alu_b),
        .reg_out_1(reg_out_1),
        .reg_out_2(reg_out_2),
        .reg_w(reg_w),
        .reg_write_en(reg_write_en),
        .alu_op(alu_op)
    );
    
    register_file rf(
        .clk(clk),
        .reg_1(instr[25:21]),
        .reg_2(instr[20:16]),
        .reg_w(reg_w),
        .reg_write_en(reg_write_en),
        .reg_write_data(alu_res),
        .reg_out_1(reg_out_1),
        .reg_out_2(reg_out_2)
    );
    
    alu alu_0(
        .alu_a(reg_out_1),
        .alu_b(alu_b),
        .alu_res(alu_res),
        .op(alu_op)
    );
    
endmodule
