# RTL — Eight-Bit Tri-State Buffer Array

## 1. Purpose

This directory contains the RTL (Register Transfer Level) source code for the eight-bit buffer array in ECE 426/516 Homework.

The circuit consists of eight tri-state buffers sharing a common enable signal.

## 2. What is `bufif1`?

`bufif1` is a built-in Verilog gate primitive that models an **active-high tri-state buffer**.

Syntax:

```verilog
bufif1 (output_port, input_port, enable_port);
```

The three arguments are positional:

- `output_port`: The signal driven by the buffer.
- `input_port`: The signal passed through the buffer.
- `enable_port`: Controls whether the buffer drives the output.

### Behaviour

| Enable | Input | Output |
|---|---|---|
| `1` | `0` | `0` |
| `1` | `1` | `1` |
| `0` | `0` or `1` | `Z` |

When the enable is `1`, the buffer passes the input to the output.

When the enable is `0`, the output becomes `Z` (high impedance). This means the buffer is not actively driving the output; it does not mean the output is logic `0`.

## 3. Circuit Description

The eight-bit buffer array has:

- `E`: Common active-high enable.
- `I[7:0]`: Eight-bit input bus.
- `D[7:0]`: Eight-bit output bus.

Each bit has its own `bufif1` instance. All eight instances share the same enable signal `E`.

When `E = 1`:

`D[7:0] = I[7:0]`

When `E = 0`:

`D[7:0] = 8'bzzzzzzzz`

## 4. Example Structural Verilog

```verilog
module buffer_array (
    input E,
    input [7:0] I,
    output [7:0] D
);

    bufif1 b0 (D[0], I[0], E);
    bufif1 b1 (D[1], I[1], E);
    bufif1 b2 (D[2], I[2], E);
    bufif1 b3 (D[3], I[3], E);
    bufif1 b4 (D[4], I[4], E);
    bufif1 b5 (D[5], I[5], E);
    bufif1 b6 (D[6], I[6], E);
    bufif1 b7 (D[7], I[7], E);

endmodule
```

## 5. Verification Plan

The testbench should check:

1. With `E = 1`, the output matches the input for different eight-bit patterns.
2. With `E = 0`, the output becomes high impedance (`Z`).
3. The output responds correctly when the input or enable changes.

The simulation will use Icarus Verilog. Testbench automation can be added separately under the tests directory.
