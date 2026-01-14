// compute_core_tb.v
`include "definitions.vh"

module compute_core_tb;
    
    // Inputs
    reg clk;
    reg reset;
    
    // Outputs
    wire halt;
    
    // Instantiate the compute_core module
    compute_core uut (
        .clk(clk),
        .reset(reset),
        .halt(halt)
    );
    
    // Clock generation: 10 time unit period
    initial clk = 0;
    always #5 clk = ~clk;
    
    // Testbench stimulus
    initial begin
        $display("========================================");
        $display("    Compute Core Testbench Start");
        $display("========================================");
        $display("Time\tReset\tHalt\tPC[0]\tPC[1]\tPC[2]\tPC[3]\tPC[4]\tPC[5]\tPC[6]\tPC[7]");
        
        // Initialize signals
        reset = 1;
        
        // Apply reset pulse (single time only!)
        #10 reset = 0;
        
        $display("\n[INFO] Reset released. Starting computation...\n");
        
        // Wait for halt signal or timeout
        wait(halt == 1);
        
        $display("\n========================================");
        $display("    All Threads Halted - Test Passed!");
        $display("========================================");
        
        // Display final register states
        $display("\nFinal Register States:");
        $display("Thread 0: R0=%h R1=%h R2=%h R3=%h", 
                 uut.register_file[0][0], uut.register_file[0][1], 
                 uut.register_file[0][2], uut.register_file[0][3]);
        $display("Thread 1: R0=%h R1=%h R2=%h R3=%h", 
                 uut.register_file[1][0], uut.register_file[1][1], 
                 uut.register_file[1][2], uut.register_file[1][3]);
        
        // Display final data memory
        $display("\nFinal Data Memory:");
        $display("mem[0]=%h mem[1]=%h mem[2]=%h mem[3]=%h", 
                 uut.data_mem[0], uut.data_mem[1], uut.data_mem[2], uut.data_mem[3]);
        
        #50;  // Wait a bit after halt
        $finish;
    end
    
    // Timeout mechanism - in case halt never asserts
    initial begin
        #50000;  // 50000 time units = 5000 cycles timeout
        $display("\n========================================");
        $display("    ERROR: Simulation Timeout!");
        $display("    Halt signal never asserted");
        $display("========================================");
        $finish;
    end
    
    // Monitor PC values every clock cycle
    always @(posedge clk) begin
        if (!reset) begin  // Only display when not in reset
            $display("%0t\t%0b\t%0b\t%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h", 
                     $time, reset, halt,
                     uut.pc[0], uut.pc[1], uut.pc[2], uut.pc[3],
                     uut.pc[4], uut.pc[5], uut.pc[6], uut.pc[7]);
        end
    end
    
    // Monitor halt signal
    always @(posedge halt) begin
        $display("\n[INFO] Halt signal asserted at time %0t", $time);
    end
    
    // Performance counter
    integer cycle_count;
    initial cycle_count = 0;
    
    always @(posedge clk) begin
        if (!reset && !halt)
            cycle_count = cycle_count + 1;
    end
    
    // Display performance metrics at end
    initial begin
        wait(halt == 1);
        #10;
        $display("\nPerformance Metrics:");
        $display("Total cycles executed: %0d", cycle_count);
        $display("Average cycles per thread: %0d", cycle_count / `NUM_THREADS);
    end
    
endmodule