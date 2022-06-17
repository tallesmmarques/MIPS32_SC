module pc_reg (
  input wire [31:0]pc_bar, 
  input wire clock, reset,
  output reg [31:0]pc
);
  initial pc = 0;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      pc <= 0;
    end else begin
      pc <= pc_bar;
    end
  end
endmodule