`include "pc.v"

module pc_tb;  
  reg [31:0]pc_bar;
  reg clk, rst;
  wire [31:0]pc;

  pc_reg U0 (pc_bar, clk, rst, pc);

  initial begin
    pc_bar = 12;
    rst = 0;
    clk = 0;
    #7 pc_bar = 50;
    #5 rst = 1;
    #5 rst = 0;
  end

  initial begin
    $dumpfile("pc_tb.vcd");
    $dumpvars;
  end

  always #5 clk = !clk;
  initial #30 $finish;
endmodule