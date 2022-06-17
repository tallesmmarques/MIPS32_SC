module registers_file (
  input wire [4:0] a1, a2, a3, 
  input wire [31:0] wd3, 
  input wire we3, clk,
  output wire [31:0] rd1, rd2
);
  reg [31:0] registers [0:31];

  integer i;
  initial begin
    registers[0] = 0;
  end

  always @(posedge clk) begin
    if (we3 && a3 != 0) begin
      registers[a3] = wd3;
    end
  end

  assign rd1 = registers[a1];
  assign rd2 = registers[a2];
endmodule