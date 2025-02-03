# DSD_2023_EE_168
# Experiment 2: Combinational Circuits: Structural Modeling using Vivado

This repository contains the RTL design, constraint file, and diagrams for a logic circuit implemented as part of Experiment 2.

## Overview

This project focuses on the design and implementation of a given combinational circuit. The design process involved:

1. **RTL Design:** Writing the Register-Transfer Level (RTL) description of the circuit using SystemVerilog.
2. **Constraint File Creation:** Developing a constraint file (XDC format for Xilinx, or appropriate format for your target FPGA) to guide the synthesis and place-and-route process for the FPGA.  This file specifies timing constraints, pin assignments, and other crucial parameters.
3. **Diagram Creation:** Generating block diagrams and/or schematics to visually represent the circuit's architecture and data flow.

## Files Included

*   `rtl/[circuit_name].sv`: SystemVerilog RTL code for the logic circuit.  (e.g., `rtl/adder_subtractor.sv`)
*   `constraints/[fpga_name].xdc`: Constraint file for the target FPGA. (e.g., `constraints/xc7a100tcsg324-1.xdc`)
*   `diagrams/[circuit_name]_block_diagram.pdf`: Block diagram of the circuit. (e.g., `diagrams/adder_subtractor_block_diagram.pdf`)  (Or other image format like PNG, SVG, etc.)
*   `diagrams/[circuit_name]_schematic.pdf` (Optional): Schematic diagram of the circuit. (e.g., `diagrams/adder_subtractor_schematic.pdf`)
*   `[project_name].xpr` (Optional): Project file for the FPGA development tool (e.g., Xilinx Vivado).

## Results

[Describe the results of the implementation. This could include timing information, resource utilization (LUTs, FFs, etc.), and any performance metrics. If you have simulation waveforms, you can refer to them here.]

Example:

*   Maximum Frequency: [e.g., 100 MHz]
*   LUT Utilization: [e.g., 50]
*   FF Utilization: [e.g., 20]

## Conclusion

[Summarize the project and discuss any challenges faced or lessons learned.]

## Author

[Your Name]

## Date

[Date]
