# Question 5: Sum-of-Minterms Boolean Function

## Objective

Implement the Boolean function using Verilog and verify its output for all possible input combinations.

## Boolean Function

\[
F(A,B,C,D)=\Sigma(0,2,4,6,9,10,13,15)
\]

The function has four inputs (`A`, `B`, `C`, and `D`) and one output (`F`).

The output is HIGH for minterms 0, 2, 4, 6, 9, 10, 13, and 15. It is LOW for all other input combinations.

## Implementation

The function is implemented using structural Verilog primitive gates:

- NOT gates generate complemented inputs.
- AND gates implement the individual minterms.
- An OR gate combines the selected minterms.

## Project Structure

- `rtl/minterm_function.v` — Boolean function implementation.
- `tests/tb_minterm_function.v` — Testbench.
- `Makefile` — Compilation and simulation workflow.
- `run_sim.py` — Automated simulation log checker.
- `minterm_function.vcd` — Generated waveform.
- `simulation.log` — Simulation output.

## Run the Simulation

From this directory, execute:

    make

The Makefile compiles the RTL and testbench, runs the simulation, and invokes the Python checker.

## View the Waveform

Execute:

    gtkwave minterm_function.vcd

Add signals `A`, `B`, `C`, `D`, and `F` to the waveform display.

## Verification

The testbench checks all 16 possible input combinations.

Expected results:
- Total combinations: 16
- Total errors: 0
- Final status: ALL TESTS PASSED