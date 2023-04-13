module memory_example(
    input logic [7:0] addr,
    input logic [7:0] data_in,
    input logic wr_en,
    output logic [7:0] data_out
);

    logic [7:0] mem [0:255]; // 256 字节的存储器

    always_ff @(posedge clk) begin
        if (wr_en)
            mem[addr] <= data_in; // 在时钟上升沿时将输入数据写入指定地址
    end

    assign data_out = mem[addr]; // 从指定地址读取数据

endmodule
