# -----------------------------------------------
# Project
# Implementation of a Small GPU Using Verilog
# -----------------------------------------------

## I. Program Documentation

### 1. Introduction
### 2. Overall GPU Architecture
#### 2.1 High-Level Architecture Overview
#### 2.2 Core Components and Data Flow
#### 2.3 Thread-Level Parallelism Model
#### 2.4 Global Memory Organization
#### 2.5 Key Features of the Proposed GPU

### 3. Scheduler Module
#### 3.1 Role of the Scheduler in GPU Execution
#### 3.2 Scheduling Strategy
#### 3.3 Interface and Control Signals

### 4. Instruction Fetcher Module
#### 4.1 Instruction Fetch Mechanism
#### 4.2 Program Counter Management
#### 4.3 Interaction with Instruction Memory

### 5. Instruction Decoder Module
#### 5.1 Instruction Format
#### 5.2 Decoding Process
#### 5.3 Control Signal Generation

### 6. Arithmetic Logic Unit (ALU)
#### 6.1 Purpose of the ALU
#### 6.2 Supported Operations
#### 6.3 ALU Input and Output Interface

### 7. Compute Core Integration
#### 7.1 Compute Core Architecture
#### 7.2 Integration of Scheduler, Fetcher, Decoder, and ALU
#### 7.3 Multi-thread Execution Flow
#### 7.4 Halt and Control Logic

---

## II. Testbench Documentation

### 1. Verification Methodology
### 2. Module-Level Testbenches
#### 2.1 Scheduler Testbench
#### 2.2 Fetcher Testbench
#### 2.3 Decoder Testbench
#### 2.4 ALU Testbench
### 3. Compute Core Simulation Using Cocotb
### 4. Simulation Results and Waveform Analysis

---

## III. Contribution

### 1. Task Distribution
### 2. Individual Contributions

---

## IV. Acknowledgements







