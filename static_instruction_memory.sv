`timescale 1ns / 1ps


module static_instruction_memory(
    input logic clk,
    input logic [31:0] pc,
    output logic [31:0] instr
    );
    
    // initialize a static array of 1024 bytes (for testing)
    logic [31:0] data [0:1023];
    
    initial begin
      data[0] = {6'd8, 5'd0, 5'd8, 16'd0};
      for(int i=1; i<1024; i++) begin
        if (i % 2 == 0) 
            data[i] = {6'd8, 5'd8, 5'd8, 16'd1};
        else
            data[i] = {6'd8, 5'd8, 5'd8, -16'd1}; 
      end
    end
    
    // always @(posedge clk) instr <= data[pc];
    assign instr = data[pc]; 
    
    // always_comb @
endmodule
