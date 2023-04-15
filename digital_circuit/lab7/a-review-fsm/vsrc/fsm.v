// 一个mealy状态机的实现
module fsm(
  input wire [0:0] clk,
  input wire [0:0] reset_n,
  input wire [0:0] in_data,
  output reg [0:0] out_data,
  output reg [3:0] out_led
);

  // 状态定义
  localparam S0 = 2'b00;
  localparam S1 = 2'b01;
  localparam S2 = 2'b10;
  localparam S3 = 2'b11;

  // 状态寄存器和输出寄存器
  reg [1:0] state = S0;
  reg [0:0] out_reg;
  reg [3:0] led;
  // 增加 out_led 显示到LD上亮灯
  always @(posedge clk or negedge reset_n) begin
    if (~reset_n) begin
      state <= S0;
      out_reg <= 0;
    end else begin
      case (state)
        S0: begin
          state <= in_data ? S1 : S0;
          out_reg <= 0;
          led <= 4'b0001;
        end
        S1: begin
          state <= in_data ? S2 : S0;
          out_reg <= 0;
          led <= 4'b0010;
        end
        S2: begin
          state <= in_data ? S3 : S0;
          out_reg <= 0;
          led <= 4'b0100;
        end
        S3: begin
          state <= S0;
          out_reg <= 1;
          led <= 4'b1000;
        end
      endcase
    end
  end


  // 输出寄存器与输出信号的连线
  assign out_data = out_reg;
  assign out_led = led ;

endmodule
