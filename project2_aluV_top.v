`timescale 1ns / 1ps

/*
 *  Project 2
 *  Module  : project2_aluV_top
 *  Names   : Joseph Blethen, Alex Karapetkov
 *  Date    : 02-23-2024
 *  Note    : A module that implements the system design demonstrated by the 
              ALU figure in the P2 spec (includes ALU control unit and ALU).
 *
 *  This work complies with the JMU honor code.
 *
 */

module project2_aluV_top (
    input [1:0] aluop,
    input [9:0] funcCode,
    input [7:0] a, b,
    output [7:0] result,
    output zero, carryout, overflow
    );
    wire [3:0] aluCtrl;

    // instantiate ALU control and ALU modules
    aluVcntrl control(aluop, funcCode, aluCtrl);
    aluV_8 alu(aluCtrl, a, b, zero, carryout, overflow, result);
endmodule
