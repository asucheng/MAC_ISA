# pPIM MAC ISA RTL Design

This repository contains a Verilog-based implementation of a custom instruction set architecture (ISA) tailored for Multiply-Accumulate (MAC) operations in a processing-in-memory (pPIM) architecture. The design includes a behavioral simulation testbench and modular RTL components.

## Overview

This project explores in-memory compute acceleration through a simple yet extensible ISA supporting iterative MAC instructions. The ISA was designed to reduce instruction fetch overhead by enabling multi-cycle operations controlled via a microcoded control table.

##  Architecture Components

The pPIM ISA consists of four main RTL modules:

-   **Instruction Register**: Latches incoming 32-bit instructions.
    
-   **Instruction Decoder**: Decodes the upper 3 bits (`[31:29]`) to determine the operation (OP.SEL).
    
-   **Program Counter / Counter Unit**: Drives instruction flow and loop control, supports reset/load/increment operations.
    
-   **Microtable**: A 20x8-bit ROM-like control memory that sequences operations and feeds control signals back to the counter.
    

A skip-flag mechanism is used to prevent conflicting reset/load signals during the final cycle of repeated MACs.
