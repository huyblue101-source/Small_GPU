// compute_core_tb.v


module compute_core_tb;

    // Parameters
    parameter DATA_WIDTH = 32;      
    parameter NUM_THREADS = 4;      
    parameter REG_COUNT = 16;     
    parameter ADDR_WIDTH = 4;     

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

    // Clock generation
    always begin
        #5 clk = ~clk;  // Tạo xung đồng hồ với chu kỳ 10 đơn vị thời gian
    end

    // Testbench stimulus
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;  // Bắt đầu với reset

        // Display header
        $display("Time\tReset\tHalt\tPC[0]\tPC[1]\tPC[2]\tPC[3]");

        // Apply reset and release it after some time
        #10 reset = 0; // Thực hiện reset tại thời điểm t = 0

        // Wait for some clock cycles and observe behavior
        #50; 

        // Test - simulate scheduling and instruction execution
        $display("Running computation...");
        #100; 

        // Apply a reset again to see the reset behavior
        reset = 1;
        #10 reset = 0;
        #50;

        // End simulation
        $finish;
    end

    // Monitor the PC and halt signal for debugging
    always @(posedge clk) begin
        $display("%0t\t%0b\t%0b\t%h\t%h\t%h\t%h", $time, reset, halt,
                 uut.pc[0], uut.pc[1], uut.pc[2], uut.pc[3]);
    end

endmodule