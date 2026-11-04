# RTL: Minterm Function

## Design File

`minterm_function.v`

## Interface

- Inputs: `A`, `B`, `C`, `D`
- Output: `F`

## Boolean Function

\[
F(A,B,C,D)=\Sigma(0,2,4,6,9,10,13,15)
\]

## Implementation Details

The design uses structural Verilog primitive gates.

- NOT gates generate complemented inputs.
- Eight AND gates identify the specified minterms.
- One OR gate combines the minterms to generate the output.

The output is HIGH for the eight specified minterms and LOW for all remaining combinations.