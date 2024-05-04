`timescale 1ns / 1ps

/*
 *  Project 1 - Test Bench
 *  Module  : full_adder_tb
 *  Names   : Joseph Blethen, Alex Karapetkov
 *  Date    : 02-11-2024
 *  Note    : A module that tests the 2-bit full adder circuit.
 *  This work complies with the JMU honor code.
 */

module full_adder_tb;
    wire sum, cout;
    reg a, b, cin;
    localparam step = 10;
    full_adder full_adder_tb(sum, cout, a, b, cin);
    initial begin
        $monitor ("sum=0x%0h cout=0x%0h a=0x%0h b=0x%0h cin=0x%0h", sum, cout, a, b, cin);
        // Checks each line of the truth table from input 0 through 7.
        a=0; b=0; cin=0; #step; // 0
        a=0; b=0; cin=1; #step; // 1
        a=0; b=1; cin=0; #step; // 2
        a=0; b=1; cin=1; #step; // 3
        a=1; b=0; cin=0; #step; // 4
        a=1; b=0; cin=1; #step; // 5
        a=1; b=1; cin=0; #step; // 6
        a=1; b=1; cin=1; #step; // 7
        $finish();
    end
endmodule
