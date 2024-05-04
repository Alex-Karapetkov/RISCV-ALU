`timescale 1ns / 1ps

/*
 *  Project 2
 *  Module  : aluV_8
 *  Names   : Joseph Blethen, Alex Karapetkov
 *  Date    : 02-23-2024
 *  Note    : A module that emulates an 8-bit RISC-V ALU design.
 *
 *  This work complies with the JMU honor code.
 *
 */

module aluV_8(
    input [3:0] ALUctrl,
    input [7:0] A, B,
    output zero, carryout, overflow,
    output reg [7:0] result
    );

    wire [7:0] sum, diff; // Output bus
    adder8 plus(sum, carryout, overflow, A, B); // Adder instantiation
    subtractor8 minus(diff, carryout, overflow, A, B); // Subtractor instantiation

    assign zero = (result == 0);
    always@(*) begin
        case(ALUctrl) // case statement to account for operations supported by the ALU
            0: result = A & B;
            1: result = A | B;
            2: result = sum;
            6: result = diff;
            7: result = A < B ? 1 : 0; // Set less than
            12: result = ~(A | B); // NOR
            default: result = 0;
        endcase
    end
endmodule
