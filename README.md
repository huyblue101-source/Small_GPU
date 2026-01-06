# Small_GPU
A team project where we break down how a minimal GPU works in CS365 with Dr. Han.

## Overview
This project implements a **simple multi-threaded Tiny GPU** using **Verilog** for educational purposes.  
The design focuses on illustrating core GPU concepts such as **SIMT-style execution**, **per-thread program counters**, and **round-robin scheduling**, rather than performance optimization.

The project was developed as part of a university course to demonstrate understanding of basic GPU architecture and hardware design principles.

---

## Features
- Multi-thread execution model (NUM_THREADS = 8)
- Independent **Program Counter (PC)** per thread
- Independent **register file** per thread
- Round-robin thread scheduler
- Basic instruction set with arithmetic, control flow, and memory operations
- Simplified execution pipeline (no pipelining)

---

## Architecture Overview
The Tiny GPU consists of a single compute core that executes multiple threads in a **SIMT-like** manner.

### Main Components
- **Fetcher**  
  Fetches instructions from instruction memory using the PC of the scheduled thread.

- **Decoder**  
  Decodes the instruction into opcode, register addresses, and immediate values.

- **Scheduler**  
  Selects the next active thread using a round-robin policy.

- **Compute Core**  
  Executes instructions, manages registers, updates PCs, and handles memory access.

- **ALU**  
  Performs arithmetic and comparison operations.

---

## Instruction Set Architecture (ISA)

### Supported Instructions
| Opcode | Instruction | Description |
|------|------------|-------------|
| ADD  | ADD Rd, Rs1, Rs2 | Integer addition |
| SUB  | SUB Rd, Rs1, Rs2 | Integer subtraction |
| MUL  | MUL Rd, Rs1, Rs2 | Integer multiplication |
| CMP  | CMP Rs1, Rs2 | Compare two registers |
| ADDI | ADDI Rd, Imm | Add immediate |
| SUBI | SUBI Rd, Imm | Subtract immediate |
| JMP  | JMP Imm | Unconditional jump |
| JLT  | JLT Imm | Jump if less-than |
| LDR  | LDR Rd, Imm | Load from data memory |
| STR  | STR Rd, Imm | Store to data memory |
| HALT | HALT | Stop execution of current thread |

---

## Multi-Thread Execution Model
- The GPU supports **8 concurrent threads**.
- Each thread maintains:
  - Its own **Program Counter**
  - Its own **register file**
- Threads execute one at a time based on scheduler selection.
- When a thread executes `HALT`, only that thread stops; other threads continue execution.

---

## Memory Organization
- **Instruction Memory**  
  Stores program instructions shared by all threads.

- **Data Memory**  
  Shared data memory accessible via load and store instructions.

Both memories are initialized using `.mem` files for simulation.

---

## Simplifications and Design Choices
To keep the design minimal and suitable for learning purposes:
- Dispatcher logic is merged into the scheduler
- Load/Store Unit (LSU) is integrated into the compute core
- No pipeline or out-of-order execution
- No device control registers (DCR)

These simplifications help focus on core GPU concepts rather than hardware complexity.

---

## Simulation and Testing
Simulation is performed using **Icarus Verilog**.

### Compile and Run
```bash
iverilog -g2012 -s compute_core_tb src/*.v testbench/*.v
vvp a.out
