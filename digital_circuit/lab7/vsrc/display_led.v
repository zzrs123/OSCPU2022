module display_led(
    input wire [7:0] data,
    input wire [7:0] de_code,
    input wire [7:0] counter,
    output reg [6:0] out_led0,
    output reg [6:0] out_led1,
    output reg [6:0] out_led2,
    output reg [6:0] out_led3,
    output reg [6:0] out_led4,
    output reg [6:0] out_led5
);
    // 得到键盘码之后就可以驱动七段数码管显示了
    bcd7led led_low1(
        .in_signals(data[3:0]),
        .out_led(out_led0)
    );
    bcd7led led_low2(
        .in_signals(data[7:4]),
        .out_led(out_led1)
    );

    // 得到count之后可以驱动中间两位七段数码管了
    // 0418:得到的ascii还是要转换成可显示的，比如字符f decode为十进制102，实际上给的是16进制 66
    // 8位宽就是 0110 0110
    bcd7led led_mid1(
        .in_signals(de_code[3:0]),
        .out_led(out_led2)
    );
    bcd7led led_mid2(
        .in_signals(de_code[7:4]),
        .out_led(out_led3)
    );

    // 得到ASCII后就可以驱动高位七段数码管了
    bcd7led led_hig1(
        .in_signals(counter[3:0]),
        .out_led(out_led4)
    );
    bcd7led led_hig2(
        .in_signals(counter[7:4]),
        .out_led(out_led5)
    );

endmodule