module light(
  input clk,
  input rst,
  output reg [15:0] lout
);
    reg [31:0] count;
    always @(posedge clk) begin
        if (rst) begin 
            lout <= 1; count <= 0;
        end else begin
        if (count == 0) lout <= {lout[14:0], lout[15]};
        count <= (count >= 5000000 ? 32'b0 : count + 1);
        end
  end
endmodule
