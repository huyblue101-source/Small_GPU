module scheduler_tb;

    // Parameters
    parameter NUM_THREADS = 4; 
    parameter THREAD_ID_WIDTH = 3; 

    // Inputs
    reg clk;
    reg reset;
    reg [NUM_THREADS-1:0] active_threads;  

    // Outputs
    wire [THREAD_ID_WIDTH-1:0] scheduled_thread; 

    // Instantiate the scheduler module
    scheduler #(
        .NUM_THREADS(NUM_THREADS)
    ) uut (
        .clk(clk),
        .reset(reset),
        .active_threads(active_threads),
        .scheduled_thread(scheduled_thread)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;  
    end

    // Testbench stimulus
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        active_threads = 4'b1111;  

        // Display header
        $display("Time\tReset\tActive Threads\tScheduled Thread");

        // Apply reset and release it after a while
        #10 reset = 0;  

        // Chạy thử với các active_threads khác nhau
        #10 active_threads = 4'b1110;  
        #10 active_threads = 4'b1101;  
        #10 active_threads = 4'b1011;  
        #10 active_threads = 4'b1000;  

        #10 active_threads = 4'b1111;

        // Test with reset again
        #10 reset = 1;  
        #10 reset = 0;  

        #50 $finish;
    end

    // Monitor output
    always @(posedge clk) begin
        $display("%0t\t%0b\t%0b\t%0d", $time, reset, active_threads, scheduled_thread);
    end

endmodule