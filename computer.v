`include "processor.v"
`include "instruction_memory.v"

module computer (
  input wire clk, rst
);
  wire [31:0] aim, dim; // address/data instruction memory
  // wire [31:0] adm, ddm; // address/data data memory

  processMIPS32_SC P (clk, rst, dim, aim);
  instruction_memory IM (aim, dim);

endmodule