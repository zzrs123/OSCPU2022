// 8-3 优先编码器
module encoder83(
    input wire [0:0] en,
    input wire [7:0] in_signals,
    output reg [3:0] out_code
);

  integer i = 0;
  always @(in_signals or en) begin
    if(en) begin
      out_code = 0;
      for( i = 0; i <= 7; i = i+1) begin
          if(in_signals[i] == 1) begin
            out_code = { 1'b1, i[2:0] };
          end 
      end
    end
    else  begin
      out_code = 0;
    end
  end
endmodule