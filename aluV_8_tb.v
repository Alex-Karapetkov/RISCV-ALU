`timescale 1ns / 1ps

/*
 *  Project 2 - Test Bench
 *  Module  : aluV_8_tb
 *  Names   : Joseph Blethen, Alex Karapetkov
 *  Date    : 02-25-2024
 *  Note    : A module that tests the 8-bit ALU.
 *
 * This work complies with the JMU honor code.
 *
 */

module aluV_8_tb;
    reg [3:0] ALUctrl;
    reg [7:0] A, B;
    wire zero, carryout, overflow;
    wire [7:0] result;
    localparam step = 10;
    aluV_8 alu(ALUctrl, A, B, zero, carryout, overflow, result);
  initial
    begin
      $display("Testing aluVcntrl");
      $monitor("t=%4d  ALUctrl=%d  a=%d  b=%d  zero=%b cout=%b  oflow=%b  result=%d", $time, ALUctrl, A, B, zero, carryout, overflow, result);
      // ALUctrl of 0 means AND
      // ALUctrl of 1 means OR
      // ALUctrl of 2 means ADD
      // ALUctrl of 6 means SUBTRACT
      // ALUctrl of 7 means SET LESS THAN
      // ALUctrl of 12 means NOR
      // ALUctrl of 15 means ERROR
      ALUctrl=0;  A=1; B=1; #step;  // 1 AND 1 = 1
      ALUctrl=0;  A=1; B=0; #step;  // 1 AND 0 = 0
      ALUctrl=1;  A=1; B=0; #step;  // 1 OR 0  = 1
      ALUctrl=1;  A=0; B=0; #step;  // 0 OR 0  = 0
      ALUctrl=2;  A=5; B=2; #step;  // 5 ADD 2 = 7
      ALUctrl=6;  A=7; B=2; #step;  // 7 SUB 2 = 5
      ALUctrl=7;  A=2; B=7; #step;  // 2 SLT 7 = 1
      ALUctrl=7;  A=7; B=2; #step;  // 7 SLT 2 = 0
      ALUctrl=12; A=0; B=0; #step;  // 0 NOR 0 = -1 or 255
      ALUctrl=12; A=0; B=1; #step;  // 0 NOR 1 = -2 or 254
      ALUctrl=13; A=0; B=0; #step;  // ERROR   = 0
      $finish();
    end
endmodule
