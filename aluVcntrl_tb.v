`timescale 1ns / 1ps

/*
 *  Project 2 - Test Bench
 *  Module  : aluVcntrl_tb
 *  Names   : Joseph Blethen, Alex Karapetkov
 *  Date    : 02-25-2024
 *  Note    : A module that tests the RISC-V ALU controller circuit.
 *
 * This work complies with the JMU honor code.
 *
 */

module aluVcntrl_tb;
    reg [1:0] ALUOp;
    reg [9:0] FuncCode;
    wire [3:0] ALUCtrl;
    localparam step = 10;
    aluVcntrl control(ALUOp, FuncCode, ALUCtrl);
  initial
    begin
      $display("Testing aluVcntrl");
      $monitor("t=%4d  ALUOp=%d  funcCode=%d  ALUCtrl=%b", $time, ALUOp, FuncCode, ALUCtrl);
      // Tests the limited implementation of the ALU from instructions.
      // 0000 means AND
      // 0001 means OR
      // 0010 means ADD
      // 0110 means SUBTRACT
      // 0111 means SET LESS THAN
      // 1100 means NOR
      // 1111 means ERROR
      ALUOp = 2'b01; FuncCode = 10'b0000000111; #step; // 0000 for I-type instruction of 7
      ALUOp = 2'b01; FuncCode = 10'b0000000001; #step; // 0001 for I-type instruction of 1
      ALUOp = 2'b00; FuncCode = 10'b0000000001; #step; // 0010 for U-type instruction of any kind
      ALUOp = 2'b10; FuncCode = 10'b0000000000; #step; // 0010 for R-type instruction of 0
      ALUOp = 2'b10; FuncCode = 10'b0100000000; #step; // 0110 for R-type instruction of 256
      ALUOp = 2'b10; FuncCode = 10'b0000000010; #step; // 0111 for R-type instruction of 2
      ALUOp = 2'b01; FuncCode = 10'b0100000111; #step; // 1100 for I-type instruction of 263
      ALUOp = 2'b11; FuncCode = 10'b1111111111; #step; // 1111 for all other instructions
      $finish();
    end
endmodule
