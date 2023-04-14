module lfsr_random(
    input  wire [0:0] clk,
    output reg  [7:0] out_data,
    output reg  [6:0] out_led1,
    output reg  [6:0] out_led2
);
    // reg [11:0] led = 12'b000000000000;
    parameter begin_data = 8'b0000_0001;
    // reg [3:0] out_code1, out_code2;
    shift shift_i0(
        .clk(clk),
        .in_data(8'b0000_0001),
        .out_data(out_data)
    );
    bcd7led led_ones(
        .in_signals(out_data[3:0]),
        .out_led(out_led1)
    );
    bcd7led led_tens(
        .in_signals(out_data[7:4]),
        .out_led(out_led2)
    );

endmodule