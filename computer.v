`include "processor.v"
`include "instruction_memory.v"
`include "data_memory.v"

module computer (
  input wire clk, rst,
  output wire [31:0] info
);
  wire [31:0] aim, rdim; // address/read instruction memory
  wire [31:0] adm, rddm, wddm; // address/read/write data memory
  wire we;

  processMIPS32_SC P (
    clk, rst, rdim, rddm, aim, adm, wddm, we );
  instruction_memory IM (aim, rdim);
  data_memory DM (
    adm, wddm, we, clk, rddm, info );
endmodule