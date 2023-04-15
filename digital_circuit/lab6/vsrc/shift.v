// 需要显示到数码管，
// 所以还是将移位寄存器单独放到一个子模块

module shift(
    input wire [0:0] clk,
    input wire [7:0] in_data,
    output reg [7:0] out_data
);
    parameter CLK_NUM = 5000000;

    reg [31:0] count = 32'h00;
    reg [0:0]  bili   = 1'b0;

    initial begin
        // in_data = 8'b0000_0001;
        out_data = in_data;
    end

    assign bili = out_data[4] ^ out_data[3] ^ out_data[2] ^ out_data[0];

    always @(posedge clk) begin
        if (count == CLK_NUM) begin
            count <= 32'h00;
            out_data <= { bili, out_data[7:1] };
        end
        else begin
            count <= count + 1;
        end
    end

endmodule