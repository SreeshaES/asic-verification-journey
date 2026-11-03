# Question 2(b): Eight-Bit Bidirectional Buffer Array

## 1. Objective

Design an eight-bit bidirectional buffer array using the `Buffer1`, `not`, and `and` primitives specified in the assignment.

The circuit has two eight-bit buses, `A[7:0]` and `B[7:0]`, a direction-select input `SR`, and a chip-enable input `CE`.

## 2. Single-Bit Circuit

One bit of the circuit uses two tri-state buffers connected in opposite directions:

- Buffer `ab0` transfers data from `A0` to `B0`.
- Buffer `ba0` transfers data from `B0` to `A0`.

The direction-control logic is:

```verilog
not (nSR, SR);

and (en_A_to_B, CE, SR);
and (en_B_to_A, CE, nSR);

Buffer1 ab0 (B0, A0, en_A_to_B);
Buffer1 ba0 (A0, B0, en_B_to_A);
```

The `Buffer1` port order is:

```verilog
Buffer1 (output, input, enable);
```

The enable equations are:

- A to B: `en_A_to_B = CE AND SR`
- B to A: `en_B_to_A = CE AND NOT SR`

When a buffer is disabled, its output is high impedance (`Z`).

## 3. Truth Table

| CE | SR | A to B | B to A |
|---:|---:|---|---|
| 0 | 0 | Disabled | Disabled |
| 0 | 1 | Disabled | Disabled |
| 1 | 0 | Disabled | Enabled |
| 1 | 1 | Enabled | Disabled |

`X` may be used for `SR` in the disabled cases because direction does not matter when `CE = 0`.

## 4. Eight-Bit Extension

The single-bit circuit is repeated for bits 0 through 7. All eight bit slices share the same direction and enable signals. Each bit transfers independently, while the control logic is shared.

## 5. Important Design Property

Only one direction should be enabled at a time. This prevents the two sides from simultaneously driving each other through the bidirectional circuit.

The buses are disconnected from one another when `CE = 0`.
