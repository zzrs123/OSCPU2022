module register_example(
    input logic clk,
    input logic rst_n,
    input logic [7:0] data_in,
    output logic [7:0] data_out
);

    logic [7:0] reg_data;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            reg_data <= 0; // 异步复位，将寄存器数据清零
        else
            reg_data <= data_in; // 在时钟上升沿时将输入数据加载到寄存器中
    end

    assign data_out = reg_data; // 输出当前存储的数据

endmodule
