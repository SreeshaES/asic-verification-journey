# Question 4: Eight-Input Even-Parity Output

## Objective

Implement an eight-input even-parity output using structural Verilog primitive gates and verify it with a testbench.

## Inputs and Output

- Inputs: I0 through I7
- Output: OP

OP is HIGH when an even number of inputs are HIGH.

## Logic

The design uses XOR gates to determine the parity of the eight inputs, followed by an inverter to produce the even-parity output.

OP = NOT (I0 XOR I1 XOR I2 XOR I3 XOR I4 XOR I5 XOR I6 XOR I7)

## Project Structure

- `rtl/even_parity_generator.v` — structural gate-level implementation.
- `tests/tb_even_parity_generator.v` — testbench.
- `Makefile` — compilation and simulation flow.
- `run_sim.py` — simulation log checker.
- `even_parity_generator.vcd` — generated waveform.
- `simulation.log` — simulation output.

## Run the Simulation

From this directory, run:

    make

The Python checker verifies that all 256 combinations were tested and that the error count is zero.

## View the Waveform

Run:

    gtkwave even_parity_generator.vcd

Add I0 through I7 and OP to the waveform display.

## Expected Results

OP = 1 for 0, 2, 4, 6, or 8 HIGH inputs.

OP = 0 for 1, 3, 5, or 7 HIGH inputs.

