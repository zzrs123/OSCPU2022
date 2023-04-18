// 键盘控制器模块 ps2_keyboard.v
// 手册上的代码格式很乱，这份就是整理了一下
// 顺便理解一下代码
module ps2_keyboard(
    input wire [0:0] clk,
    input wire [0:0] clrn,
    input wire [0:0] ps2_clk,// fpga 接口
    input wire [0:0] ps2_data,// fpga 接口
    input wire [0:0] nextdata_n,
    output reg [7:0] data,
    output reg [0:0] ready,
    output reg [0:0] fifo_overflow,
    output reg [7:0] press_count // 读取按键的次数，也就是‘按键’的次数
);
    // 2023/04/17 将这些移出module声明，不需要作为output
    reg [9:0] buffer;
    reg [7:0] fifo_list[7:0];
    reg [2:0] w_ptr;
    reg [2:0] r_ptr;
    reg [3:0] count;
    reg [2:0] ps2_clk_sync ;
    /*
        ps2_clk_sync记录PS2时钟信号的历史信息，
        并检测时钟的下降沿，当发现下降沿时将sampling置1。
        sampling置为1时符合ps2时序约束，才能开始存储ps2数据
    */

    always @(posedge clk) begin
        ps2_clk_sync <= {ps2_clk_sync[1:0],ps2_clk};
    end
    wire sampling = ps2_clk_sync[2] & ~ps2_clk_sync[1];

    /*
        开始逐位接收数据并放入缓冲区fifo队列,
        收集完11个bit后将缓冲区转移至数据队列fifo。
    */
    always @(posedge clk) begin
        // 清零重置
        if (clrn == 0) begin
            count <= 0;
            w_ptr <= 0;
            r_ptr <= 0;
            fifo_overflow <= 0;
            ready <= 0;
            press_count <= 0;
        end else begin
            // 读取逻辑,键盘处理模块读取键盘控制模块的fifo_list
            if (ready) begin
                // nextdata_n：键盘处理模块确认读取完毕的信号，=0时移动读指针
                if(nextdata_n == 1'b0) begin
                    r_ptr <= r_ptr + 3'b1;
                    if(w_ptr == (r_ptr + 1'b1))
                        ready <= 1'b0;
                end
            end
            // 写逻辑
            if (sampling) begin
                // 如果count==10，
                if (count == 4'd10) begin
                    if ((buffer[0] == 0) &&// start bit
                        (ps2_data)      &&// stop bit
                        (^buffer[9:1])) begin// odd  parity  // 校验位 !0418从'&'->'^'!!!

                        fifo_list[w_ptr] <= buffer[8:1];// kbd scan code

                        if (buffer[8:1] == 8'hf0) begin
                            press_count <= press_count + 1'b1;
                        end else begin
                        end

                        w_ptr <= w_ptr+3'b1;
                        ready <= 1'b1; // 队列不为空，有数据需要处理
                        fifo_overflow <= fifo_overflow | (r_ptr == (w_ptr + 3'b1)) ; 

                    end
                    
                    count <= 0;
                end else begin
                    buffer[count] <= ps2_data;
                    count <= count + 3'b1;
                end
            end
        end
    end

    assign data = fifo_list[r_ptr];
    
endmodule