//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2026 04:03:03 PM
// Design Name: 
// Module Name: instructionMemory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps

module instructionMemory #(
    parameter OPERAND_LENGTH = 31
)(
    input [OPERAND_LENGTH:0] instAddress,
    output reg [31:0] instruction
);

    // 256 bytes of instruction memory
    reg [7:0] memory [0:255];

    // Load machine code from memory initialization file
    initial begin
        $readmemh("instructions.mem", memory);
    end

    // Read a 32-bit instruction using PC
    always @(*) begin

        if (instAddress <= 252 &&
            instAddress[1:0] == 2'b00) begin

            instruction = {
                memory[instAddress + 3],
                memory[instAddress + 2],
                memory[instAddress + 1],
                memory[instAddress]
            };

        end
        else begin
            instruction = 32'h00000013; // RISC-V NOP
        end

    end

endmodule
