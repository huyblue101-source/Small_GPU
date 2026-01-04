// decoder_tb.v


module decoder_tb;

    // Parameters
    parameter DATA_WIDTH = 16;  // Chiều rộng của instruction (16 bit)

    // Inputs
    reg [DATA_WIDTH-1:0] instruction;

    // Outputs
    wire [3:0] opcode;
    wire [3:0] dest_reg;
    wire [3:0] src1_reg;
    wire [3:0] src2_reg;
    wire [7:0] immediate;

    // Instantiate the decoder module
    decoder uut (
        .instruction(instruction),
        .opcode(opcode),
        .dest_reg(dest_reg),
        .src1_reg(src1_reg),
        .src2_reg(src2_reg),
        .immediate(immediate)
    );

    // Testbench stimulus
    initial begin
        // Initialize signals
        instruction = 16'b0001_1010_1100_0011; // Một giá trị instruction mẫu

        // Display header
        $display("Time\tInstruction\tOpcode\tDest_Reg\tSrc1_Reg\tSrc2_Reg\tImmediate");

        // Apply different instruction values and monitor output
        #10 instruction = 16'b1001_0101_0110_0111;  // Thay đổi giá trị instruction
        #10 instruction = 16'b0110_1111_0001_0010;  // Một giá trị instruction khác
        #10 instruction = 16'b1110_0000_1000_1111;  // Thêm một giá trị khác

        // End simulation
        #10 $finish;
    end

    // Monitor outputs during simulation
    always @(instruction) begin
        $display("%0t\t%h\t\t%h\t\t%h\t\t%h\t\t%h\t\t%h", 
                 $time, instruction, opcode, dest_reg, src1_reg, src2_reg, immediate);
    end

endmodule