`timescale 1ns / 1ps

/*
 *  Project 2
 *  Module  : aluVcntrl
 *  Names   : Joseph Blethen, Alex Karapetkov
 *  Date    : 02-23-2024
 *  Note    : A module that generates the ALU control signals from the function
              code in the instruction and the ALUOp.
 *
 *  This work complies with the JMU honor code.
 *
 */

module aluVcntrl (ALUOp, FuncCode, ALUCtrl);
    input [1:0] ALUOp;
    input [9:0] FuncCode;
    output reg [3:0] ALUCtrl;

    // lower order bits of function code are lower order bits of instruction
    // funccode[0] is I[12] and funccode [3] is I[25]
    // need to support and, or, add, subtract, set less than, and nor
    // ALU control inputs: 0000 - AND, 0001 - OR, 0010 - add, 0110 - subtract

    always @(*) begin
        if (ALUOp==2'b01 && FuncCode==7) begin // fcode = 111b
            ALUCtrl = 4'b0000; // AND
        end
        else if (ALUOp==2'b01 && FuncCode==1) begin // fcode = 1b
            ALUCtrl = 4'b0001; // OR
        end
        else if (ALUOp==2'b00 || ALUOp==2'b10 && FuncCode==0) begin // fcode = 0b
            ALUCtrl = 4'b0010; // Add
        end
        else if (ALUOp==2'b10 && FuncCode==256) begin // fcode = 1 0000 0000b
            ALUCtrl = 4'b0110; // Subtract
        end
        else if (ALUOp==2'b10 && FuncCode==2) begin // fcode = 10b
            ALUCtrl = 4'b0111; // Set Less than
        end
        else if (ALUOp==2'b01 && FuncCode==263) begin // fcode = 100000111b
            ALUCtrl = 4'b1100; // Nor
        end
        else begin
            ALUCtrl = 4'b1111; // Should not happen
        end
    end
endmodule
