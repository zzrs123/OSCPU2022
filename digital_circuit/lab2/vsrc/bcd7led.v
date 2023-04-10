module bcd7led (
    input wire [3:0] in_signals,
    output reg [6:0] out_led
);
/* 
    最刚开始用3位表示10位数，后来又看手册是需要表示16位
    并且已经给出了led模块的例程
    但是指定的是8-3编码器，所以默认{1'b0,input_signals}
    共阳极，给0则亮。
    得理解它这个逻辑
*/
    always @(*) begin
        case(in_signals)
            4'b0000: out_led = 7'b100_0000;// 0
            4'b0001: out_led = 7'b111_1001;// 1
            4'b0010: out_led = 7'b010_0100;// 2
            4'b0011: out_led = 7'b011_0000;// 3
            4'b0100: out_led = 7'b001_1001;// 4
            4'b0101: out_led = 7'b001_0010;// 5
            4'b0110: out_led = 7'b000_0010;// 6
            4'b0111: out_led = 7'b111_1000;// 7
            // 虽然lab2只能表示出前面这8个数，但全写吧
            4'b1000: out_led = 7'b000_0000;// 8
            4'b1001: out_led = 7'b001_0000;// 9
            4'b1010: out_led = 7'b000_1000;// A
            4'b1011: out_led = 7'b000_0011;// B
            4'b1100: out_led = 7'b100_0110;// C
            4'b1101: out_led = 7'b010_0010;// D
            4'b1110: out_led = 7'b011_0000;// E
            4'b1111: out_led = 7'b011_1000;// F

            default: out_led = 7'b000_0000;
        endcase           
    end
endmodule
