`timescale 1ns / 1ps

/*
 *  Project 2 - Test Bench
 *  Module  : subtractor8_tb
 *  Names   : Joseph Blethen, Alex Karapetkov
 *  Date    : 02-25-2024
 *  Note    : A module that tests the 8-bit subtractor circuit.
 *
 * This work complies with the JMU honor code.
 *
 */

module subtractor8_tb;
    wire [7:0] diff;
    wire borrowout, underflow;
    reg [7:0] a, b;
    localparam step=10;
    subtractor8 minus(diff, borrowout, underflow, a, b);
  initial
    begin
      $display("Testing subtractor8");
      $monitor("t=%4d  diff=%d  bout=%b  uflow=%b  a=%d  b=%d", $time, diff, borrowout, underflow, a, b);
      // Tests subtraction of random numbers
      // Remember that for 8-bit 2's comp, negatives are between 127 and 256.
      a=7; b=3; #step;      // expects 4
      a=38; b=8; #step;     // expects 30,      positive - positive = positive : no underflow
      a=8; b=38; #step;     // expects -30/226, positive - positive = negative : no underflow
      a=-5; b=-10; #step    // expect 5,        negative - negative = positive : no underflow
      a=-10; b=-5; #step    // expect -5,       negative - negative = negative : no underflow
      a=5; b=-127; #step;   // expect -124/132, positive - negative = negative : underflow
      a=-127; b=5; #step    // expect -132/124, negative - positive = positive : underflow
      $finish();
    end
endmodule
