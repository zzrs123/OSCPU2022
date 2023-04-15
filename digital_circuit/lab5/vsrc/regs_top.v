module regs_top(
    input  wire [0:0] clk,
    input  wire [0:0] wr_en,
    input  wire [7:0] in_data,
    input  wire [3:0] in_data_addr,
    input  wire [3:0] out_data_addr,
    output reg  [7:0] out_data
);
    parameter REGS_WIDTH      = 8;
    parameter REGS_WIDTH_ADDR = 4;
    // regs regs_inst0(
    //     .clk(clk),
    //     .wr_en(wr_en),
    //     .in_data(in_data),
    //     .in_data_addr(in_data_addr),
    //     .out_data_addr(out_data_addr),
    //     .out_data(out_data));
    // defparam regs_inst0.REGS_WIDTH = 8;
    // defparam regs_inst0.REGS_WIDTH_ADDR = 4;
    reg [REGS_WIDTH-1:0] regs[(2**REGS_WIDTH_ADDR)-1:0];

        initial begin
            $readmemb("mem.txt", regs);
        end

        always @(posedge clk) begin
            if (wr_en) begin
                regs[in_data_addr] <= in_data;
            end
            else begin
                ;
            end
        end

        assign out_data = regs[out_data_addr];


endmodule