`timescale 1ns / 1ps


module control_unit(
    input logic [31:0] instr,
    input logic [31:0] reg_out_1,
    input logic [31:0] reg_out_2,
    output logic [31:0] alu_b,
    output logic [4:0] reg_w,
    output logic reg_write_en,
    output logic [5:0] alu_op
    );
    
    import constants::*;
    
    logic [5:0] opcode, func;
    logic [31:0] imm;
    logic alu_use_reg_out_2;
    
    assign opcode = instr[31:26];
    assign func = instr[5:0];
    assign imm = {{16{instr[15:0]}}, instr[15:0]};
    
    always_comb begin
        case(opcode)
            OP_R_TYPE: alu_use_reg_out_2 <= 1;
            OP_BEQ: alu_use_reg_out_2 <= 1;
            OP_BNE: alu_use_reg_out_2 <= 1;
            default: alu_use_reg_out_2 <= 0;
        endcase
    end
    
    assign alu_b = alu_use_reg_out_2 ? reg_out_2 : imm;
    assign reg_w = |opcode ? instr[20:16] : instr[15:11];
    
    always_comb begin
        case(opcode)
            OP_R_TYPE: reg_write_en <= 1; // R type
            OP_ADDI: reg_write_en <= 1;
            OP_ADDIU: reg_write_en <= 1;
            OP_SLTI: reg_write_en <= 1;
            OP_SLTIU: reg_write_en <= 1;
            OP_ANDI: reg_write_en <= 1;
            OP_ORI: reg_write_en <= 1;
            OP_XORI: reg_write_en <= 1;
            
            OP_LUI: reg_write_en <= 1;
            
            OP_LB: reg_write_en <= 1;
            OP_LH: reg_write_en <= 1;
            OP_LWL: reg_write_en <= 1;
            OP_LW: reg_write_en <= 1;
            OP_LBU: reg_write_en <= 1;
            OP_LHU: reg_write_en <= 1;
            OP_LWR: reg_write_en <= 1;
            default: reg_write_en <= 0;
        endcase
    end
    
    always_comb begin
            case(opcode)
                OP_ADDI: alu_op <= ALU_ADD;
                OP_ADDIU: alu_op <= ALU_ADD;
                /*OP_SLTI: reg_write_en <= 1;
                OP_SLTIU: reg_write_en <= 1;*/
                OP_ANDI: alu_op <= ALU_AND;
                OP_ORI: alu_op <= ALU_OR;
                OP_XORI: alu_op <= ALU_XOR;
                OP_LUI: alu_op <= ALU_ADD;
                OP_R_TYPE: begin
                    case(func)
                        FN_ADD: alu_op <= ALU_ADD;
                        FN_ADDU: alu_op <= ALU_ADD;
                        FN_SUB: alu_op <= ALU_SUB;
                        FN_SUBU: alu_op <= ALU_SUB;
                        FN_AND: alu_op <= ALU_AND;
                        FN_OR: alu_op <= ALU_OR;
                        FN_XOR: alu_op <= ALU_XOR;
                        FN_NOR: alu_op <= ALU_NOR;
                        /*FN_SLT: alu_op <= ALU_SUB;
                        FN_SLTU: alu_op <= ALU_SUB;*/
                    endcase
                end
                default: alu_op <= 6'bx;
            endcase
        end
endmodule
