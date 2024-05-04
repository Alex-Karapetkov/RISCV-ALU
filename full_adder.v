`timescale 1ns / 1ps

/*
 *  Project 1
 *  Module  : full_adder
 *  Names   : Joseph Blethen, Alex Karapetkov
 *  Date    : 02-11-2024
 *  Note    : A module that adds two 2-bit numbers.
 *
 *  This work complies with the JMU honor code.
 *
 */

module full_adder(
    output sum, cout,
    input a, b, cin
    );
    wire fromXor, fromAnd0, fromAnd1;
    // Sum is true for either A, B, or carry-in exclusively; or all true.
    xor(fromXor, a, b);
    xor(sum, fromXor, cin);
    // Carry-out is true for at least 2 simultaneous A, B, or C.
    and(fromAnd0, fromXor, cin);
    and(fromAnd1, a, b);
    or(cout, fromAnd0, fromAnd1);
endmodule
