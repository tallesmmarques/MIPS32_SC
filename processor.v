`include "datapath_components/pc.v"
`include "datapath_components/sum.v"

module processMIPS32_SC (
  input wire clk, rst,
  input wire [31:0] instr,
  output wire [31:0] addressInstr
);
  wire [31:0] pc_bar, pc;

  pc_reg PCReg (pc_bar, clk, rst, pc);
  sum PCPlusFour (pc, 4, pc_bar);

  assign addressInstr = pc;
endmodule