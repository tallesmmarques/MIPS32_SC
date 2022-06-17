module alu_decoder (
  input wire [1:0] aluOp,
  input wire [5:0] funct,
  output reg [2:0] aluControl
);
  always @(*) begin
    case (aluOp)
      2'b00: aluControl <= 3'b010;  // add
      2'b01: aluControl <= 3'b110;  // sub
      2'b10: begin                  // funct
        case (funct)
          32: aluControl <= 3'b010; // add
          34: aluControl <= 3'b110; // sub
          36: aluControl <= 3'b000; // and
          37: aluControl <= 3'b001; // or
        endcase
      end 
      2'b11: aluControl <= 3'b011;  // n/a
    endcase
  end
endmodule