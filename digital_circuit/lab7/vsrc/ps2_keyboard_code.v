// 键盘码的译码模块
module ps2_keyboard_code(
    input wire [7:0] in_data,
    output reg [7:0] out_code
);
// version1: without ctrl or shift
    always @(*) begin
        
    end
