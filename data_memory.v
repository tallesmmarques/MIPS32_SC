module data_memory (
  input wire [31:0] a, wd, 
  input wire we, clk, 
  output wire [31:0] rd, info
);
  reg [7:0] memory [0:255]; 

  always @(posedge clk) begin
    if (we) begin
      memory[a]   = wd[31:24];
      memory[a+1] = wd[23:16];
      memory[a+2] = wd[15:8];
      memory[a+3] = wd[7:0];
    end
  end

  assign rd[31:24] = memory[a];
  assign rd[23:16] = memory[a+1];
  assign rd[15:8]  = memory[a+2];
  assign rd[7:0]   = memory[a+3];

  assign info[31:24] = memory[252];
  assign info[23:16] = memory[253];
  assign info[15:8]  = memory[254];
  assign info[7:0]   = memory[255];

  initial begin
    $readmemh("data.mem", memory);
  end
endmodule
