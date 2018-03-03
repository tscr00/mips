`timescale 1ns / 1ps

package constants;

    /* MIPS opcodes and func values for R type commands */
    
    parameter OP_R_TYPE = 6'd0;
    
    // jump opcodes
    parameter OP_J = 6'd2;
    parameter OP_JAL = 6'd3;
    parameter OP_BEQ = 6'd4;
    parameter OP_BNE = 6'd5;
    parameter OP_BLEZ = 6'd6;
    parameter OP_BGTZ = 6'd7;
    
    // arithmetic and logic opcodes
    parameter OP_ADDI = 6'd8;
    parameter OP_ADDIU = 6'd9;
    parameter OP_SLTI = 6'd10;
    parameter OP_SLTIU = 6'd11;
    parameter OP_ANDI = 6'd12;
    parameter OP_ORI = 6'd13;
    parameter OP_XORI = 6'd14;
    parameter OP_LUI = 6'd15;
    
    // save load opcodes
    parameter OP_LB = 6'd32;
    parameter OP_LH = 6'd33;
    parameter OP_LWL = 6'd34;
    parameter OP_LW = 6'd35;
    parameter OP_LBU = 6'd36;
    parameter OP_LHU = 6'd37;
    parameter OP_LWR = 6'd38;
    parameter OP_SB = 6'd40;
    parameter OP_SH = 6'd41;
    parameter OP_SWL = 6'd42;
    parameter OP_SW = 6'd43;
    parameter OP_SWR = 6'd46;
    
    // R type funct values
    parameter FN_SLL = 6'd0;
    parameter FN_SRL = 6'd2;
    parameter FN_SRA = 6'd3;
    parameter FN_SLLV = 6'd4;
    parameter FN_SRLV = 6'd6;
    parameter FN_SRAV = 6'd7;
    
    parameter FN_ADD = 6'd32;
    parameter FN_ADDU = 6'd33;
    parameter FN_SUB = 6'd34;
    parameter FN_SUBU = 6'd35;
    parameter FN_AND = 6'd36;
    parameter FN_OR = 6'd37;
    parameter FN_XOR = 6'd38;
    parameter FN_NOR = 6'd39;
    parameter FN_SLT = 6'd42;
    parameter FN_SLTU = 6'd43;
    
    parameter FN_MFHI = 6'd16;
    parameter FN_MTHI = 6'd17;
    parameter FN_MFLO = 6'd18;
    parameter FN_MTLO = 6'd19;
    parameter FN_MULT = 6'd24;
    parameter FN_MULTU = 6'd25;
    parameter FN_DIV = 6'd26;
    parameter FN_DVIU = 6'd27;
    
    // jump funct values
    parameter FN_JR = 6'd8;
    parameter FN_JALR = 6'd9;
    
    /* ALU op codes */
    parameter ALU_ADD = 6'd0;
    parameter ALU_SUB = 6'd1;
    parameter ALU_AND = 6'd2;
    parameter ALU_OR  = 6'd3;
    parameter ALU_XOR = 6'd4;
    parameter ALU_NOR = 6'd5;
endpackage
