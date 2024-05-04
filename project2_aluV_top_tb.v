`timescale 1ns / 1ps

/*
 *  Project 2 - Testbench
 *  Module  : project2_aluV_top_tb
 *  Names   : Joseph Blethen, Alex Karapetkov
 *  Date    : 02-25-2024
 *  Note    : A testbench for the top module that implements the ALU and ALU control.
 *
 *  This work complies with the JMU honor code.
 *
 */

module project2_aluV_top_tb;
    reg [1:0] aluop;
    reg [9:0] funcCode;
    reg [7:0] a, b;
    wire [7:0] result;
    wire zero, carryout, overflow;
    localparam step = 10;
    project2_aluV_top top(aluop, funcCode, a, b, result, zero, carryout, overflow);
  initial
    begin
      $display("Testing aluVcntrl");
      $monitor("t=%4d  aluop=%d  funcCode=%d  a=%d  b=%d  result=%d  zero=%b  cout=%b  oflow=%b", $time, aluop, funcCode, a, b, result, zero, carryout, overflow);
      // aluop 1 fcode 7   is AND
      // aluop 1 fcode 1   is OR
      // aluop 2 fcode 0   is ADD | aluop 0 is ADD
      // aluop 2 fcode 256 is SUBTRACT
      // aluop 2 fcode 2   is SET LESS THAN
      // aluop 1 fcode 263 is NOR
      aluop=1; funcCode=7;   a=1; b=1; #step;  // 1 AND 1 = 1
      aluop=1; funcCode=7;   a=1; b=0; #step;  // 1 AND 0 = 0
      aluop=1; funcCode=7;   a=7; b=5; #step;  // 7 AND 5 = 5 ** Official Test
      aluop=1; funcCode=1;   a=1; b=0; #step;  // 1 OR 0  = 1
      aluop=1; funcCode=1;   a=0; b=0; #step;  // 0 OR 0  = 0
      aluop=1; funcCode=1;   a=7; b=5; #step;  // 7 OR 5  = 7 ** Official Test
      aluop=2; funcCode=0;   a=5; b=2; #step;  // 5 ADD 2 = 7
      aluop=2; funcCode=0;   a=23; b=13; #step;// 23 ADD 13 = 36 ** Official Test
      aluop=2; funcCode=256; a=7; b=2; #step;  // 7 SUB 2 = 5
      aluop=2; funcCode=256; a=23; b=13; #step;// 23 SUB 13 = 10 ** Official Test
      aluop=2; funcCode=2;   a=2; b=7; #step;  // 2 SLT 7 = 1
      aluop=2; funcCode=2;   a=7; b=2; #step;  // 7 SLT 2 = 0
      aluop=1; funcCode=263; a=0; b=0; #step;  // 0 NOR 0 = -1 or 255
      aluop=1; funcCode=263; a=0; b=1; #step;  // 0 NOR 1 = -2 or 254
      aluop=1; funcCode=263; a=7; b=5; #step;  // 7 NOR 5 = -8 or 248 ** Official Test
      aluop=0; funcCode=2;   a=7; b=5; #step;  // 7 LW 5 = 12 ** Official Test
      aluop=1; funcCode=8;   a=7; b=5; #step;  // 7 BEQ 5 = 2 ** Official Test
      aluop=3; funcCode=3;   a=0; b=0; #step;  // ERROR   = 0
      $finish();
    end
endmodule
