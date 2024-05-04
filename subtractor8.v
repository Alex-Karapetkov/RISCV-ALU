`timescale 1ns / 1ps

/*
 *  Project 2
 *  Module  : subtractor8
 *  Names   : Joseph Blethen, Alex Karapetkov
 *  Date    : 02-25-2024
 *  Note    : A module that subtracts two 8-bit numbers and gives a difference, borrowout, and underflow.
 *
 *  This work complies with the JMU honor code.
 *
 */

module subtractor8(
    output [7:0] diff,
    output borrowout, underflow,
    input [7:0] a,
    input [7:0] b
    );
    // Connects each borrow-out (bout) to each borrow-in (bin) for ripple borrow.
    wire [7:0] n, bout;
    
    // flipping every bit of b input to generate ~B
    not(n[0], b[0]);
    not(n[1], b[1]);
    not(n[2], b[2]);
    not(n[3], b[3]);
    not(n[4], b[4]);
    not(n[5], b[5]);
    not(n[6], b[6]);
    not(n[7], b[7]);

    // each borrow out goes into borrow in of next full adder
    full_adder bit0(diff[0], bout[0], a[0], n[0], 1'b1); // borrow in for first full adder is 1 since A + ~B + 1 = A - B
    full_adder bit1(diff[1], bout[1], a[1], n[1], bout[0]);
    full_adder bit2(diff[2], bout[2], a[2], n[2], bout[1]);
    full_adder bit3(diff[3], bout[3], a[3], n[3], bout[2]);
    full_adder bit4(diff[4], bout[4], a[4], n[4], bout[3]);
    full_adder bit5(diff[5], bout[5], a[5], n[5], bout[4]);
    full_adder bit6(diff[6], bout[6], a[6], n[6], bout[5]);
    full_adder bit7(diff[7], bout[7], a[7], n[7], bout[6]);
    xor(underflow, bout[6], bout[7]);
    assign borrowout = bout[7];
endmodule
