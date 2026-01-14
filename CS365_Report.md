# -----------------------------------------------
#                    Project
# Implementation of a small GPU by using Verilog.
# -----------------------------------------------
## I. Program Documentation

### Introduction
Graphics Processing Units (GPUs) are computing devices designed to efficiently process large amounts of data in parallel. They are well suited for tasks that require many operations to be performed at the same time. Although GPUs were first developed for graphics rendering, they are now widely used in areas such as machine learning, scientific computation, and big data processing.

Compared to Central Processing Units (CPUs), which mainly execute instructions sequentially, GPUs are optimized for parallel execution. This is made possible by their architecture, which contains many small processing cores that operate concurrently. As a result, GPUs can process large datasets and perform complex calculations more efficiently than CPUs for parallel workloads.

This report examines the architecture of GPUs and simulates their main components using Verilog. Key modules such as the Arithmetic Logic Unit (ALU), decoder, fetch unit, scheduler, and compute core are modeled to illustrate how GPUs operate and support parallel computation.
### 1. GPU Architecture
The design of a GPU focuses on supporting large-scale parallel processing and high computational bandwidth. This is accomplished through the integration of many functional components that work together to execute operations in an efficient manner.


- **Device Control Register**: This unit is responsible for controlling and configuring the operational state of the GPU. It enables the host system to manage GPU execution and monitor its status.

- **Dispatcher**: The dispatcher distributes tasks among the Compute Cores. Its role is to balance workloads across the architecture in order to improve performance and reduce idle core time.

- **Cache**: The cache functions as a fast local storage layer within the GPU architecture, temporarily holding commonly used instructions and data. Its primary purpose is to shorten data retrieval time by reducing dependence on slower main memory.

- **Program Memory Controller and Data Memory Controller**: These units are responsible for regulating instruction and data movement between the compute resources and memory subsystems. By managing memory transactions and synchronizing read/write operations, they help maintain steady data throughput and prevent performance degradation caused by memory access delays.

#### 1.1 Core Compute
#### 1.2 GPU Core
#### 1.3 Global Memory
#### 1.4 Key Features of GPU Architecture
### 2. Scheduler in GPU
### 3. Fetcher in GPU
### 4. Decoder in GPU
### 5. ALU in GPU
### 6. GPU Compute Core
## II. Testbench Documentation
## III. Contribution
## IV. Acknowledgements





