// lab7的顶层模块 ps2_control.v
module ps2_func(
    input wire [0:0] clk,
    input wire [0:0] clrn,
    input wire [0:0] ps2_clk,
    input wire [0:0] ps2_data,
    output reg [0:0] ready,
    output reg [0:0] fifo_overflow,
    output reg [6:0] out_led0,
    output reg [6:0] out_led1,
    output reg [6:0] out_led2,
    output reg [6:0] out_led3,
    output reg [6:0] out_led4,
    output reg [6:0] out_led5
);

    reg [7:0] press_count = 8'b0;
    reg [7:0] key_code;
    reg [7:0] de_code;

    
    // 输入外部时钟、和键盘数据
    // 得到扫描码和时序
    ps2_keyboard keyboard_i0(
        .clk(clk),
        .clrn(clrn),
        .ps2_clk(ps2_clk),  // fpga接口
        .ps2_data(ps2_data),// fpga接口
        // in-out
        .nextdata_n(1'b0),
        .data(key_code),
        .ready(ready),
        .fifo_overflow(fifo_overflow),
        .press_count(press_count)
    );

    // ps2_fsm control_i0(
    //     .clk(clk),
    //     .clrn(clrn),
    //     .ps2_clk(ps2_clk),
    //     .ps2_data(ps2_data),
    //     .fifo_overflow(fifo_overflow),
    //     .ready(ready),
    //     .out_led1(out_led4), 
    //     .out_led2(out_led5)
    // );

    ps2_decode decoder_i0(
        .in_data(key_code),
        .out_code(de_code)
    );
    display_led display_i0(
        .data(key_code),
        .de_code(de_code),
        .counter(press_count),
        .out_led0(out_led0),
        .out_led1(out_led1),
        .out_led2(out_led2),
        .out_led3(out_led3),
        .out_led4(out_led4),
        .out_led5(out_led5)
    );
endmodule