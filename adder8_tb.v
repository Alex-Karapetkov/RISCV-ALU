/*
 *  Project 2 - Test Bench
 *  Module  : adder8_tb
 *  Names   : Joseph Blethen, Alex Karapetkov
 *  Date    : 02-25-2024
 *  Note    : A module that tests the 8-bit adder circuit.
 *
 * This work complies with the JMU honor code.
 *
 */

module adder8_tb;
    wire [7:0] sum;
    wire carryout, overflow;
    reg [7:0] a, b;
    localparam step=10;

    // instantiate the 8-bit adder module
    adder8 plus(sum, carryout, overflow, a, b);
  initial
    begin
      $display("Testing adder8");
      $monitor("t=%4d  sum=%d  cout=%b  oflow=%b  a=%d  b=%d", $time, sum, carryout, overflow, a, b);
      // Tests addition of random numbers
      // Remember that for 8-bit 2's comp, negatives are between 127 and 256.
      a=1; b=2; #step; // expects 3
      a=7; b=3; #step; // expects 10, no overflow when positive + positive = positive
      a=127; b=10; #step; // expect 137, overflow when positive + positive = negative
      a=-6; b=-20; #step // expect -26 or 230, no overflow when negative + negative = negative
      a=-127; b=-127; #step // expect 2, overflow when negative + negative = positive
      $finish();
    end
endmodule
