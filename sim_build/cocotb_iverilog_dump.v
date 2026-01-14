module cocotb_iverilog_dump();
initial begin
    $dumpfile("sim_build/compute_core.fst");
    $dumpvars(0, compute_core);
end
endmodule
