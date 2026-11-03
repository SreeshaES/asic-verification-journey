# RTL: Minority Function

## Design File

`minority_function.v`

## Description

This module implements a four-input minority function using structural Verilog gates.

Inputs: A, B, C, D  
Output: Y

The output is HIGH when fewer than two of the four inputs are HIGH.

## Expected Behaviour

| Number of HIGH inputs | Output Y |
|---:|:---:|
| 0 | 1 |
| 1 | 1 |
| 2 | 0 |
| 3 | 0 |
| 4 | 0 |

## Implementation

The design uses structural gate instantiations to implement the required Boolean function. Refer to `minority_function.v` for the actual gate-level implementation.
