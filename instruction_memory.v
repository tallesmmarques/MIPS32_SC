module instruction_memory (
  input wire [31:0] a, 
  output wire [31:0] rd
);
  reg [7:0] memory [0:255]; 

  assign rd[31:24] = memory[a];
  assign rd[23:16] = memory[a+1];
  assign rd[15:8]  = memory[a+2];
  assign rd[7:0]   = memory[a+3];

  initial begin
    $readmemh("program.mem", memory);
  end
endmodule