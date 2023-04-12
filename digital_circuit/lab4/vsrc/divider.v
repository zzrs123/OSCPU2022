// 50MHZ TO 1HZ 的分频器
// 实验手册里已经写了例程
module divider (
    input wire [0:0] in_clk, // 50MHZ
    output reg [0:0] out_clk // 1HZ
);
    // 2^25 > 24999999
    parameter COUNT_MAX = 24999999;
    reg [24:0] clk_count = 0;

    always @(posedge in_clk) begin
        
        if (clk_count == COUNT_MAX) begin
            out_clk <= ~out_clk;
            clk_count <= 0;
        end else begin 
            clk_count <= clk_count + 1;
        end

    end

endmodule