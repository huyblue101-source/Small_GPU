// definitions.vh
`ifndef DEFINITIONS_VH
`define DEFINITIONS_VH

// R-Type Instructions (Dest, Src1, Src2)
`define OP_ADD   4'b0000
`define OP_SUB   4'b0001
`define OP_MUL   4'b0010
`define OP_CMP   4'b0011

// I-Type Instructions (Dest, Immediate)
`define OP_JMP   4'b0100
`define OP_JLT   4'b0101  // Jump if Less Than
`define OP_LDR   4'b0110
`define OP_STR   4'b0111
`define OP_ADDI  4'b1000  // New: Add Immediate
`define OP_SUBI  4'b1001  // New: Sub Immediate

`define OP_HALT  4'b1111

`define DATA_WIDTH 16
`define ADDR_WIDTH 16
`define REG_COUNT 16

`define NUM_THREADS 8      
`define THREAD_ID_WIDTH 3 

`endif