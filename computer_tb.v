`include "computer.v"
`timescale 1ns/1ns

module computer_tb;
  reg clk, rst;
  wire [31:0] info;

  computer C0 (
    clk, rst, info
  );

  initial begin
    rst = 0;
    clk = 0;
    // #6 rst = 0;
  end

  always #1 clk = !clk;

  initial begin
    $dumpfile("computer.vcd");
    $dumpvars;
  end
  initial begin
    $display("Info: ");
    $monitor("%g\t%d", $time, info);
  end
  initial #500 $finish;
endmodule
