module alu (
  input wire [31:0] a, b,
  input wire [2:0] control,
  output reg [31:0] result,
  output reg zf
);
  always @(*) begin
    case (control)
      3'b000 : result <= a & b;
      3'b001 : result <= a | b;
      3'b010 : result <= a + b;
      3'b110 : result <= a - b;
      default: result <= a & b;
    endcase
    zf <= result == 0 ? 1:0; 
  end
endmodule