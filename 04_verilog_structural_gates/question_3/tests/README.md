# Testbench: Minority Function

## Testbench File

`tb_minority_function.v`

## Purpose

The testbench verifies the four-input minority function by applying every possible combination of inputs A, B, C and D.

## Test Coverage

Four binary inputs produce 2^4 = 16 possible combinations.

The testbench checks that:
- The output is 1 when zero or one inputs are HIGH.
- The output is 0 when two, three or four inputs are HIGH.
- The observed output matches the expected output for every combination.

## Pass Criteria

The simulation passes when all 16 combinations produce the expected output and the total error count is zero.

The testbench also generates `minority_function.vcd` for waveform inspection in GTKWave.