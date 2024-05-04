  `timescale 1ns / 1ps

/*
 *  Project 2 - Test Bench
 *  Module  : and_tb
 *  Names   : Joseph Blethen, Alex Karapetkov
 *  Date    : 02-25-2024
 *  Note    : A module that tests the and-circuit
 *
 * This work complies with the JMU honor code.
 *
 */

module and_tb;
    reg [3:0] ALUctrl;
    reg [7:0] a, b;
    wire zero, carryout, overflow;
    wire [7:0] result;
    
    // Instantiates an ALU
    aluV_8 alu(ALUctrl, a, b, zero, carryout, overflow, result);
    
    initial begin
        $display("Testing and-gate on ALU");
        $monitor("t=%4d  ALUctrl=%d  a=%d  b=%d  zero=%b  result=%d", $time, ALUctrl, A, B, zero, result);

        // test for and resulting in a zero result
        ALUctrl=0;  a=1; b=1; #step;
        ALUctrl=0;  a=1; b=0; #step;
        $finish();
    end
endmodule
