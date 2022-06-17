module mux2x1_32 (
  input wire [31:0] a, b,
  input wire sel,
  output wire [31:0] out
);
  assign out = (sel == 0) ? a : b;
endmodule

module mux2x1_5 (
  input wire [4:0] a, b,
  input wire sel,
  output wire [4:0] out
);
  assign out = (sel == 0) ? a : b;
endmodule