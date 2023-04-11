module alu (
    input wire [2:0] in_func,
    input wire [3:0] in_a,
    input wire [3:0] in_b,
    output reg [3:0] out_result,
    output reg [0:0] out_carry,
    output reg [0:0] out_overflow,
    output reg [0:0] out_zero
);
    always @(*) begin
        out_carry = 1'b0;
        out_overflow = 1'b0;
        out_zero = 1'b0;
        case (in_func)
            3'b000,
            3'b001: begin
                { out_carry, out_result } = in_a + in_b;
                assign out_overflow = (in_a[3] == in_b[3]) &&
                                        (out_result[3] != in_a[3]);
                assign out_zero = ~(|out_result);
            end
            3'b010:  out_result = ~in_a;
            3'b011:  out_result = in_a & in_b;
            3'b100:  out_result = in_a | in_b;
            3'b101:  out_result = in_a ^ in_b;
            3'b110:  out_result = (in_a < in_b) ? 4'b1 : 4'b0;
            3'b111:  out_result = (in_a == in_b) ? 4'b1 : 4'b0;
            default: out_result = 4'b0;
        endcase
    end
endmodule