# Testbench: Circuit Schematic

## Testbench File

`tb_circuit_schematic.v`

## Purpose

Verify the structural circuit implementation against its expected Boolean behavior.

## Test Coverage

The four binary inputs have 2^4 = 16 possible combinations.

The testbench:
- Applies all 16 input patterns.
- Calculates the expected output.
- Compares the DUT output with the expected value.
- Counts mismatches.
- Generates a VCD waveform for GTKWave.

## Pass Criteria

The test passes when all 16 combinations are checked and the total error count is zero.

The Python script `run_sim.py` checks the simulation log for the expected success messages.
