`include "alu.v"  // Bao gồm mô-đun ALU từ alu.v

module alu_tb;

    // Inputs
    reg [3:0] opcode;
    reg [`DATA_WIDTH-1:0] operand_a;
    reg [`DATA_WIDTH-1:0] operand_b;

    // Outputs
    wire [`DATA_WIDTH-1:0] result;
    wire cmp_flag;

    // Instantiate the ALU (Sử dụng mô-đun đã bao gồm từ alu.v)
    alu uut (
        .opcode(opcode),
        .operand_a(operand_a),
        .operand_b(operand_b),
        .result(result),
        .cmp_flag(cmp_flag)
    );

    // Testbench stimulus
    initial begin
        // Initialize inputs
        opcode = 4'b0000;
        operand_a = 32'h00000000;
        operand_b = 32'h00000000;

        // Display the results
        $monitor("Time = %0t, opcode = %b, operand_a = %h, operand_b = %h, result = %h, cmp_flag = %b", 
                 $time, opcode, operand_a, operand_b, result, cmp_flag);

        // Test case 1: ADD operation (Using operand_b as implicit source or immediate)
        #10 opcode = `OP_ADD; operand_a = 32'h00000005; operand_b = 32'h00000003; 
        #10; // Wait for 10 time units

        // Test case 2: SUB operation
        #10 opcode = `OP_SUB; operand_a = 32'h00000005; operand_b = 32'h00000003; 
        #10; // Wait for 10 time units

        // Test case 3: MUL operation
        #10 opcode = `OP_MUL; operand_a = 32'h00000005; operand_b = 32'h00000003; 
        #10; // Wait for 10 time units

        // Test case 4: CMP operation (comparison)
        #10 opcode = `OP_CMP; operand_a = 32'h00000003; operand_b = 32'h00000005; 
        #10; // Wait for 10 time units
        
        // Test case 5: ADDI operation (Standard ADD but testing with different values conceptually)
        #10 opcode = `OP_ADDI; operand_a = 32'h00000010; operand_b = 32'h00000002; // 16 + 2 = 18
        #10; 

        // End the simulation
        $finish;
    end

endmodule
