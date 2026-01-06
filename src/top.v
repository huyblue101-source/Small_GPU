`include "definitions.vh"

module top (
    input wire clk,
    input wire reset
);

    wire halt;

    compute_core core (
        .clk(clk),
        .reset(reset),
        .halt(halt)
    );

endmodule