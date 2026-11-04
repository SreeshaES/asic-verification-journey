# Testbench: Even-Parity Generator

## Testbench File

`tb_even_parity_generator.v`

## Purpose

Verify the even-parity output for every possible combination of the eight inputs.

## Test Coverage

Eight binary inputs have 2^8 = 256 possible combinations.

The testbench:
- Applies all 256 input patterns.
- Calculates the expected output independently.
- Compares the expected output with the DUT output.
- Counts mismatches.
- Generates a VCD waveform for GTKWave.

## Pass Criteria

The simulation passes when all 256 combinations are checked and the total error count is zero.

