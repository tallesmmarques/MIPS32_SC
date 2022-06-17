`include "computer.v"

module computer_tb;
  reg clk, rst;

  computer C0 (
    clk, rst
  );

  initial begin
    rst = 0;
    clk = 1;
    // #12 rst = 1;
    // #13 rst = 0;
  end

  always #5 clk = !clk;

  initial begin
    $dumpfile("computer.vcd");
    $dumpvars;
  end
  initial #50 $finish;
endmodule
