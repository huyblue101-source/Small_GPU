`include "definitions.vh"

module fetcher (
    input [3:0] pc_in,  // 4-bit PC for 16 entries
    output [`DATA_WIDTH-1:0] instruction
);
    // Instruction memory - 16 entries
    reg [`DATA_WIDTH-1:0] instr_mem [0:15];
    
    integer i;  // Declare at module level
    
    // Non-pipelined fetch - combinational read
    assign instruction = instr_mem[pc_in];
    
    // Initialize instruction memory
    initial begin
        $readmemh("src/instruction_memory.mem", instr_mem);
        $display("Instruction Memory Initialized in Fetcher:");
        for (i = 0; i < 16; i = i + 1) begin
            $display("instr_mem[%0d] = %h", i, instr_mem[i]);
        end
    end
    
endmodule