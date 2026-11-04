
# RTL: Even-Parity Generator

## Design File

`even_parity_generator.v`

## Interface

- Inputs: I0, I1, I2, I3, I4, I5, I6, I7
- Output: OP

## Description

The module implements the specified eight-input even-parity output using structural Verilog primitive gates.

XOR gates combine the inputs, and a NOT gate inverts the combined result.

The output is HIGH when the number of HIGH inputs is even and LOW when the number of HIGH inputs is odd.

