# RISC-V 8-bit Arithmetic Logic Unit (ALU) in Verilog

This project, co-created with Joey Blethen for a Computer Architecture course, implements an 8-bit RISC-V Arithmetic Logic Unit (ALU) in Verilog using Vivado. It supports AND, OR, addition, subtraction, set-less-than, and NOR operations. The design features a hierarchical structure with 1-bit full adders forming ripple carry adders and subtractors, and an ALU control unit that decodes instruction opcodes and function codes to safely select operations. Combining structural and behavioral Verilog, the design balances control and abstraction, ensuring accurate operation, overflow detection, and clear modularity. This work demonstrates practical digital design trade-offs within a RISC-V architecture subset.

# Project Files

The repository includes the following Verilog source and testbench files:

- adder8.v / adder8_tb.v — 8-bit ripple carry adder and its testbench

- aluV_8.v / aluV_8_tb.v — 8-bit ALU module and testbench

- aluVcntrl.v / aluVcntrl_tb.v — ALU control unit and testbench

- and_tb.v — Testbench for AND operation

- full_adder.v / full_adder_tb.v — 1-bit full adder module and testbench

- project2_aluV_top.v / project2_aluV_top_tb.v — Top-level ALU integration module and testbench

- subtractor8.v / subtractor8_tb.v  — 8-bit subtractor module

# Running the Project
To simulate and verify the design:

1. Install Vivado or a compatible Verilog simulation tool.

2. Open the project files or create a new Vivado project and add the Verilog files listed above.

3. Run the testbenches (files ending with _tb.v) to simulate the modules and verify correct operation.

4. Use the top-level testbench (project2_aluV_top_tb.v) to simulate the full ALU design.

5. Review simulation waveforms to confirm the ALU performs the expected operations including overflow and zero detection.


# Additional Information
- A detailed writeup of the project, including design decisions, schematics, timing diagrams, and design trade-offs, is included in the repository (or available upon request).

- This project highlights the combination of structural and behavioral Verilog techniques to achieve modular and safe digital design.


# Contact
For questions or collaboration, please feel free to reach out.



