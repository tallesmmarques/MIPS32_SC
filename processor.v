`include "datapath_components/pc.v"
`include "datapath_components/sum.v"
`include "datapath_components/sign_extend.v"
`include "datapath_components/registers_file.v"
`include "datapath_components/alu.v"
`include "datapath_components/mux2x1.v"
`include "datapath_components/shift_two.v"
`include "control/control.v"

module processMIPS32_SC (
  input wire clk, rst,
  input wire [31:0] instr,
  input wire [31:0] readData,
  output wire [31:0] addressInstr,
  output wire [31:0] addressData, writeData,
  output wire we
);
  wire [31:0] pc_bar, pc, srcA, srcB, rd2, signImm, aluResult, result;
  wire [2:0] aluControl;
  wire [4:0] writeReg;
  wire we3, zero, aluSrc, regDst, memToReg, branch;

  control Ctrl (
    instr[31:26], instr[5:0], aluControl,
    we, we3, aluSrc, regDst, memToReg, branch
  );

  registers_file RegistersFile (
    instr[25:21], instr[20:16], writeReg,
    result, we3, clk, srcA, rd2
  );
  sign_extend SignExtend (instr[15:0], signImm);
  alu MainALU (srcA, srcB, aluControl, aluResult, zero);
  mux2x1_32 muxALU (rd2, signImm, aluSrc, srcB);
  mux2x1_32 muxMemToReg (aluResult, readData, memToReg, result);
  mux2x1_5  muxWriteReg (instr[20:16], instr[15:11], regDst, writeReg);

  wire [31:0] shiftSignImm, pcBranch, pcPlusFour;
  pc_reg PCReg (pc_bar, clk, rst, pc);
  sum PCPlusFour (pc, 4, pcPlusFour);

  wire pcSrc = zero && branch;
  shift_two shiftBranch (signImm, shiftSignImm);
  sum SumBranch (shiftSignImm, pcPlusFour, pcBranch);
  mux2x1_32 muxPCBranch (pcPlusFour, pcBranch, pcSrc, pc_bar);

  assign addressInstr = pc;
  assign addressData = aluResult;
  assign writeData = rd2;
endmodule