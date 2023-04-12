module timer (
    input wire [0:0] clk,       // 50MHZ时钟输入
    input wire [0:0] rst,       
    input wire [2:0] control, // 开始、暂停、清零信号
    output reg [6:0] out_seg1,
    output reg [6:0] out_seg2,
    output reg [0:0] finished
);
    // 中间的线
    wire clk_1hz; // 1Hz时钟
    wire [3:0] cnt1_out, cnt2_out; // 计数器输出
    wire [3:0] out_code1, out_code2;
    // 分频器
    divider divider0(
        .in_clk(clk),
        .out_clk(clk_1hz)
    );

    // 计数器
    counter counter0(
        .clk(clk_1hz),
        .rst(rst),
        .control(control),
        .out_led1(out_code1),
        .out_led2(out_code2),
        .finished(finished)
    );
    // 数码管显示
    bcd7led led_ones(
        .in_signals(out_code1),
        .out_led(out_seg1)
    );
    bcd7led led_tens(
        .in_signals(out_code2),
        .out_led(out_seg2)
    );

endmodule   
    