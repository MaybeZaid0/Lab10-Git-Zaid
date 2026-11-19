`timescale 1ns / 1ps

module tb_instructionMemory;

    reg [31:0] pc;
    wire [31:0] instruction;

    // Instantiate the Unit Under Test (UUT)
    instructionMemory uut (
        .instAddress(pc),
        .instruction(instruction)
    );

    initial begin
        $display("Starting Instruction Memory Test");

        pc = 32'd0;
        #10;
        $display("PC = %d | Instruction = %h", pc, instruction);

        pc = 32'd4;
        #10;
        $display("PC = %d | Instruction = %h", pc, instruction);

        // Test unaligned address
        pc = 32'd2;
        #10;
        $display("PC = %d | Instruction = %h", pc, instruction);

        $finish;
    end

endmodule