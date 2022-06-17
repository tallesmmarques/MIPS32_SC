`include "control/alu_decoder.v"

module control (
  input wire [5:0] opcode, funct,
  output wire [2:0] aluControl,
  output reg we, we3, aluSrc, regDst, memToReg
);
  reg [1:0] aluOp;
  alu_decoder ALUDecoder(
    aluOp, funct, aluControl
  );

  always @(*) begin
    case (opcode)
      12: begin           // addi
        we3 <= 1'b1;
        we <= 1'b0;
        aluOp <= 2'b00;
        aluSrc <= 1'b1;
        regDst <= 1'b0;
        memToReg <= 1'b0;
      end
      35: begin           // lw
        we3 <= 1'b1;
        we <= 1'b0;
        aluOp <= 2'b00;
        aluSrc <= 1'b1;
        regDst <= 1'b0;
        memToReg <= 1'b1;
      end
      43: begin           // sw
        we3 <= 1'b0;
        we <= 1'b1;
        aluOp <= 2'b00;
        aluSrc <= 1'b1;
        regDst <= 1'b0;
        memToReg <= 1'b1;
      end 
      00: begin           // R-type
        aluOp <= 2'b10;
        we3 <= 1'b1;
        we <= 1'b0;
        aluSrc <= 1'b0;
        regDst <= 1'b1;
        memToReg <= 1'b0;
      end
      default: begin      // default
        aluOp <= 2'b11;
        we3 <= 1'b0;
        we <= 1'b0;
        aluSrc <= 1'b0;
        regDst <= 1'b1;
        memToReg <= 1'b0;
      end

    endcase
  end
endmodule