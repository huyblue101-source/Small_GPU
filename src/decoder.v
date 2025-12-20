`timescale 1ns / 1ps
`default_nettype none


module decoder #(
    parameter INST_WIDTH = 32
)(
    input  wire [INST_WIDTH-1:0] instruction,
    
    // Decoded fields
    output reg  [3:0] opcode,
    output reg  [3:0] rd,
    output reg  [3:0] rs,
    output reg  [3:0] rt,
    output reg  [15:0] immediate,

    // Control signals
    output reg        reg_write_enable,
    output reg        mem_read_enable,
    output reg        mem_write_enable
);

    // Opcode definitions
    localparam OP_NOP = 4'b0000;
    localparam OP_ADD = 4'b0001;
    localparam OP_SUB = 4'b0010;
    localparam OP_LD  = 4'b0011;
    localparam OP_ST  = 4'b0100;

    // Decode logic (combinational)
    always @(*) begin
        // Split instruction fields
        opcode    = instruction[31:28];
        rd        = instruction[27:24];
        rs        = instruction[23:20];
        rt        = instruction[19:16];
        immediate = instruction[15:0];

        // Default control signals (VERY IMPORTANT)
        reg_write_enable = 0;
        mem_read_enable  = 0;
        mem_write_enable = 0;

        // Decode based on opcode
        case (opcode)
            OP_ADD: begin
                reg_write_enable = 1;
            end

            OP_SUB: begin
                reg_write_enable = 1;
            end

            OP_LD: begin
                reg_write_enable = 1;
                mem_read_enable  = 1;
            end

            OP_ST: begin
                mem_write_enable = 1;
            end

            default: begin
                // NOP or unknown instruction
            end
        endcase
    end

endmodule

`default_nettype wire
