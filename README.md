# priority-encoder
Priority Encoder with Verification
A Verilog implementation of a 4-to-2 priority encoder with comprehensive verification.
Overview
This project implements a 4-to-2 priority encoder that converts 4-bit input signals into a 2-bit encoded output based on priority. The encoder detects the highest-priority active input bit and generates the corresponding binary code, along with a valid signal that indicates if any input is active. The design is fully synchronous with clock and reset capabilities.
Features

4-bit to 2-bit Priority Encoding:

Input bit 3 (MSB) has highest priority
Input bit 0 (LSB) has lowest priority
Valid output signal indicates active input


Synchronous Design:

All operations synchronized to the rising edge of the clock
Full reset capability


Parameterized Architecture:

Easily modifiable for different input/output widths


Complete Verification:

Comprehensive testbench covering all possible input combinations
Functional coverage metrics capturing all edge cases
Toggle coverage verification for all nodes



Module Interface
verilogmodule priority_enc (
  input  clk,          // Clock input
  input  rst,          // Reset input
  input  [3:0] D,      // 4-bit input data
  output reg [1:0] Y,  // 2-bit encoded output
  output reg valid     // Valid output signal
);
Priority Logic
The encoder implements the following priority logic:

If D[3] is 1, Y = 0 (highest priority)
If D[2] is 1, Y = 1
If D[1] is 1, Y = 2
If D[0] is 1, Y = 3 (lowest priority)
If all bits of D are 0, valid = 0, otherwise valid = 1

This is implemented using a casex statement to efficiently handle the priority encoding.
Verification
The design includes a SystemVerilog testbench that:

Tests all 16 possible input combinations
Verifies priority operation is correct
Tests reset functionality
Checks valid signal assertion/deassertion
Generates coverage reports including:

Branch coverage (100%)
Statement coverage (100%)
Toggle coverage (100%)



Directory Structure
├── rtl/                         # RTL design files
│   └── priority_enc.v           # Priority encoder implementation
├── verification/                # Verification files
│   └── priority_enc_tb.sv       # SystemVerilog testbench
├── simulation/                  # Simulation scripts
│   └── run.do                   # ModelSim script for simulation
└── docs/                        # Documentation
    └── coverage_rpt.txt         # Coverage report
Simulation
To simulate the design:

Clone the repository
Navigate to the simulation directory
Run the simulation script:
vsim -do run.do


The testbench includes automatic checking of results with detailed pass/fail messages.
Coverage Results
The testbench achieves:

100% branch coverage
100% statement coverage
100% toggle coverage

Some nodes have been explicitly excluded from coverage analysis as specified in the coverage report.
Applications
This priority encoder can be used in:

Interrupt controllers
Arbitration logic
Request handling systems
Resource allocation modules

Acknowledgments
Designed as a fundamental building block for digital control systems.
