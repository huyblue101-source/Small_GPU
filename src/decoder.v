// decoder.v
module decoder #(
    parameter DATA_WIDTH = 32
)(
    input  [DATA_WIDTH-1:0] instruction,
    output reg [3:0] opcode,
    output reg [3:0] dest_reg,
    output reg [3:0] src_reg,
    output reg [7:0] immediate
);

    always @(*) begin
        opcode    = instruction[15:12];
        dest_reg  = instruction[11:8];
        src_reg   = instruction[7:4];
        immediate = instruction[7:0];
    end

endmodule
