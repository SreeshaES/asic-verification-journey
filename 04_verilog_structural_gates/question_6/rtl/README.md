# RTL: Circuit Schematic

## Design File

`circuit_schematic.v`

## Interface

- Inputs: A, B, C, D
- Output: Y

## Description

The module implements the supplied circuit schematic using Verilog primitive gates, including NAND, NOT, AND, XNOR, OR, and NOR gates.

The final output is HIGH only when A, B, and C are HIGH and D is LOW.

## Simplified Boolean Expression

Y = A AND B AND C AND NOT(D)