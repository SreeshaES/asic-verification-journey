# Question 6: Circuit Schematic Implementation

## Objective

Implement the given digital logic circuit using Verilog primitive gates and verify its output for every possible input combination.

## Inputs and Output

- Inputs: A, B, C, D
- Output: Y

## Circuit Implementation

The circuit is implemented using structural Verilog primitive gates:

- NAND gate for inputs A and B.
- NOT gate to invert D.
- AND gate for C and the inverted D.
- XNOR gate to combine the NAND and AND outputs.
- OR and NOR gates for the remaining stages.

## Boolean Expression

The circuit simplifies to:

Y = A AND B AND C AND NOT(D)

The output is HIGH only when A = 1, B = 1, C = 1, and D = 0.

## Project Structure

- `rtl/circuit_schematic.v` — Structural Verilog implementation.
- `tests/tb_circuit_schematic.v` — Testbench.
- `Makefile` — Compilation, simulation, and checking workflow.
- `run_sim.py` — Automated simulation log checker.
- `circuit_schematic.vcd` — Generated waveform.
- `simulation.log` — Simulation output.

## Run the Simulation

From this directory, execute:

    make

The Makefile compiles the RTL and testbench, runs the simulation, and checks the log using Python.

## View the Waveform

Execute:

    gtkwave circuit_schematic.vcd

Add A, B, C, D, and Y to the waveform display.

## Verification Results

- Total input combinations: 16
- Expected output: HIGH only for input 1110
- Total errors: 0
- Expected status: ALL TESTS PASSED