`timescale 1ns / 1ps

/*
 *  Project 2
 *  Module  : adder8
 *  Names   : Joseph Blethen, Alex Karapetkov
 *  Date    : 02-25-2024
 *  Note    : A module that adds two 8-bit numbers and gives a sum, carryout, and overflow.
 *
 *  This work complies with the JMU honor code.
 *
 */

module adder8(
    output [7:0] sum,
    output carryout, overflow,
    input [7:0] a,
    input [7:0] b
    );
    // Connects each carry-out (cout) to each carry-in (cin) for ripple carry.
    wire [7:0] cout;
    full_adder bit0(sum[0], cout[0], a[0], b[0], 1'b0);
    full_adder bit1(sum[1], cout[1], a[1], b[1], cout[0]);
    full_adder bit2(sum[2], cout[2], a[2], b[2], cout[1]);
    full_adder bit3(sum[3], cout[3], a[3], b[3], cout[2]);
    full_adder bit4(sum[4], cout[4], a[4], b[4], cout[3]);
    full_adder bit5(sum[5], cout[5], a[5], b[5], cout[4]);
    full_adder bit6(sum[6], cout[6], a[6], b[6], cout[5]);
    full_adder bit7(sum[7], cout[7], a[7], b[7], cout[6]);
    
    // xor last carry-in and last carry-out to check for overflow
    xor(overflow, cout[6], cout[7]);
    assign carryout = cout[7];
endmodule
