// 状态机模块 ps2_fsm.v
// 其实是真正的顶层模块,将以状态机切换的方式将各个模块连接
module ps2_fsm(
    input wire [0:0] clk,
    input wire [0:0] clrn,
    input wire [0:0] ps2_clk,//存疑
    input wire [0:0] ps2_data,
    output reg [7:0] out_seg [7:0] // 8个7段数码管
);  

    reg [0:0] next_data;
    reg [7:0] code;
    reg [0:0] ready;
    reg [0:0] Fifo_OF;
    // 输入外部时钟、和键盘数据
    // 得到键盘码和时序
    ps2_keyboard keyboard_i0(
        .clk(clk),
        .clrn(clrn),
        .ps2_clk(ps2_clk),//后面似乎没用
        .ps2_data(ps2_data),
        .nextdata_n(next_data),
        .data(code),
        .ready(ready),
        .fifo_overflow(Fifo_OF),
    );

    // 状态定义, FPGA用独热码更好
    /*
        init
        按下（保持）
        弹起

    */
    localparam S0 = 4'b0001;
    localparam S1 = 4'b0010;
    localparam S2_ = 4'b0100;
    localparam S3_IDLE = 4'b1000;

    reg [3:0] current_state = S0;
    reg [3:0] next_state = S0;

    // FSM，三段式
    always @(posedge clk or posedge clrn) begin
        if (clrn == 0) begin
            current_state <= S3_IDLE;

        end else begin
            // current_state <= next_current;
            case(current_state) begin
                S0
            end

        end

    end
