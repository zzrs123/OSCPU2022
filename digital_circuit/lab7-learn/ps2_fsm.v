// 状态机模块 ps2_fsm.v
// 用于记录按键状态，向外提供按键次数
module ps2_fsm(
    input wire [0:0] clk,
    input wire [0:0] clrn,
    input wire [0:0] ps2_clk,//存疑
    input wire [0:0] ps2_data,
    input wire [0:0] ready,
    output reg [0:0] fifo_overflow,
    output reg [3:0] out_led1, 
    output reg [3:0] out_led2,
);  

    reg [0:0] next_data;
    // wire [7:0] code;
    // reg [7:0] de_code;
    // reg [0:0] ready;
    // reg [0:0] Fifo_OF;

    // 状态定义, FPGA用独热码更好
    /*
        init
        按下（保持）
        弹起

    */
    // parameter DELAY_COUNT = 50_000_000;
    localparam S0_IDLE = 4'b0001;//空闲
    localparam S1_PRES = 4'b0010;//按下
    localparam S2_RELE = 4'b0100;//释放
    localparam S3_ERRO = 4'b1000;//错误
    // localparam S3_IDLE = 4'b1000;

    reg [3:0] current_state;
    // reg [3:0] next_state;
    reg [25:0] counter;
    reg [7:0] key_count;
    reg [7:0] ascii_code;
/* verilator lint_off CASEINCOMPLETE */
    always @(posedge clk) begin
        if (clrn == 0) begin
            // 初始化状态
            current_state <= S0_IDLE;
            counter <= 0;
            key_count <= 0;
            // code <= 0;
            ascii_code <= 0;
        end else begin
            // FSM
            case (current_state)
                S0_IDLE: begin
                    if (ready) begin
                        // 键盘按下
                        if (code != 0) begin
                            key_count <= key_count + 1;
                            current_state <= S1_PRES;
                        end
                    end
                end
                S1_PRES: begin
                    if (ready) begin
                        // 等待按键弹起
                        if (code == 0) begin
                            current_state <= S2_RELE;
                        end
                    end
                end
                S2_RELE: begin
                    if (counter < DELAY_COUNT) begin
                        counter <= counter + 1;
                    end else begin
                        counter <= 0;
                        // 显示按键次数和ASCII码
                        ascii_code <= code;
                        current_state <= S0_IDLE;
                    end
                end
                S3_ERRO:begin
                    current_state <= S0_IDLE;
                end
                    
            endcase
        end
    end
 
    
endmodule
