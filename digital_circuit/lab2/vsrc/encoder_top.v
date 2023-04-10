module encoder_top(
    input wire [0:0] en,
    input wire [7:0] in_signals,
    output reg [3:0] out_code,
    output reg [6:0] out_led
);
    encoder83 enc_i0(
        .in_signals(in_signals),
        .en(en),
        .out_code(out_code)
    );

    bcd7led led_i0(
        .in_signals({ 1'b0, out_code[2:0]}),
        .out_led(out_led)
    );

endmodule