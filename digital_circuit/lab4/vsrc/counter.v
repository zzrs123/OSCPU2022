// 一个模100计数器, 从 00~99
module counter (
    input wire [0:0] clk,      // 1HZ的输入时钟信号
    input wire [0:0] rst, // 似乎没用
    input wire [2:0] control,// 开始暂停清零控制信号
    output reg [3:0] out_led1, 
    output reg [3:0] out_led2,
    output reg [0:0] finished
);
    
    reg [3:0] ones_count = 0;
    reg [3:0] tens_count = 0;
    reg [1:0] count_finished = 0;
    // finished = 0;
    // reg [0:0] led = 0;

    always @(posedge clk) begin
        case(control)
            3'b001: // start
                if (ones_count == 9) begin
                    ones_count <= 0;
                    if (tens_count == 9) begin
                        tens_count <= 0;
                        finished <= 1;
                    end else begin
                        tens_count <= tens_count + 1;
                    end
                end else begin
                    ones_count <= ones_count + 1;
                end 
            3'b010: finished <= 0;// pause;
                
            3'b100: begin
                // clear
                ones_count <= 0;
                tens_count <= 0;
                finished <= 0;
            end
            default: finished <= 0;// nothing
        endcase
        if (count_finished < 3) begin
            count_finished <= count_finished + 1;
        end else if (count_finished == 3) begin
            finished <= 0;
            count_finished <= 0;
        end
    end

    assign out_led1 = ones_count;
    assign out_led2 = tens_count;

endmodule