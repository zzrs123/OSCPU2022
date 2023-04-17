// 键盘码的译码模块 ps2_keyboard_code.v
// 将码翻译为ASCII
module ps2_keyboard_code(
    input wire [7:0] in_data,
    output reg [7:0] out_code
);
// version1: without ctrl or shift
    initial begin
        reg [7:0] out_ascii=0; 
    end    

    always @(*) begin
        case(in_data) begin
            8'h16: out_ascii = 8'd49;//1
            8'h1e: out_ascii = 8'd50;//2
            8'h26: out_ascii = 8'd51;//3
            8'h25: out_ascii = 8'd52;//4
            8'h2e: out_ascii = 8'd53;//5
            8'h36: out_ascii = 8'd54;//6
            8'h3d: out_ascii = 8'd55;//7
            8'h3e: out_ascii = 8'd56;//8
            8'h46: out_ascii = 8'd57;//9
            8'h45: out_ascii = 8'd49;//0
            8'h1c: out_ascii = 8'd97; // a
            8'h32: out_ascii = 8'd98; // b
            8'h21: out_ascii = 8'd99; // c
            8'h23: out_ascii = 8'd100; // d
            8'h24: out_ascii = 8'd101; // e
            8'h2b: out_ascii = 8'd102; // f
            8'h34: out_ascii = 8'd103; // g
            8'h33: out_ascii = 8'd104; // h
            8'h43: out_ascii = 8'd105; // i
            8'h3b: out_ascii = 8'd106; // j
            8'h42: out_ascii = 8'd107; // k
            8'h4b: out_ascii = 8'd108; // l
            8'h3a: out_ascii = 8'd109; // m
            8'h31: out_ascii = 8'd110; // n
            8'h44: out_ascii = 8'd111; // o
            8'h4d: out_ascii = 8'd112; // p
            8'h15: out_ascii = 8'd113; // q
            8'h2d: out_ascii = 8'd114; // r
            8'h1b: out_ascii = 8'd115; // s
            8'h2c: out_ascii = 8'd116; // t
            8'h3c: out_ascii = 8'd117; // u
            8'h2a: out_ascii = 8'd118; // v
            8'h1d: out_ascii = 8'd119; // w
            8'h22: out_ascii = 8'd120; // x
            8'h35: out_ascii = 8'd121; // y
            8'h1a: out_ascii = 8'd122; // z

        end
    end
