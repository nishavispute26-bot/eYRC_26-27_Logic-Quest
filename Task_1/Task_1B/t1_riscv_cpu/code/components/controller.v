
// controller.v - controller for RISC-V CPU

module controller (
    input [6:0]  op,
    input [2:0]  funct3,
    input        funct7b5,
    input        Zero,
    output[1:0] ResultSrc,
    output       MemWrite,
    output       PCSrc, ALUSrc,
    output       RegWrite, Jump,
    output       JumpReg,
    output [2:0] ImmSrc,
    output [1:0] ALUSrcA,
    output [2:0] ALUControl
);

wire [1:0] ALUOp;
wire       Branch;

main_decoder    md (op, ResultSrc, MemWrite, Branch,
                    ALUSrc, RegWrite, Jump, JumpReg, ImmSrc,ALUSrcA ALUOp);

alu_decoder     ad (op[5], funct3, funct7b5, ALUOp, ALUControl);

// for jump and branch
    assign PCSrc = (Branch & Zero) | Jump | JumpReg;

endmodule

