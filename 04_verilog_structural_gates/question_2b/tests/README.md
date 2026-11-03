# Question 2(b): Testbench Notes

## 1. Purpose of the Testbench

The testbench verifies the eight-bit bidirectional buffer array by driving one bus, releasing the opposite bus, and checking that the expected data is transferred.

The main scenarios are:

1. A to B transfer using an alternating-bit pattern.
2. A to B transfer using all ones.
3. B to A transfer using an alternating-bit pattern.
4. B to A transfer using all zeros.
5. Disabled operation, checking that both buses are high impedance when the testbench releases both buses.

## 2. Testbench Bus Drivers

The testbench uses separate driver variables for the two buses:

```verilog
reg [7:0] drive_A;
reg [7:0] drive_B;

wire [7:0] A;
wire [7:0] B;
```

For an A-to-B test, the testbench drives A and releases B:

```verilog
drive_A = 8'b10101010;
drive_B = 8'bzzzzzzzz;
```

The testbench supplies the source data on A. The DUT is expected to transfer that data to B.

The testbench then compares the observed value of B against the expected pattern using case inequality (`!==`). This detects mismatches, including unexpected `X` or `Z` values.

## 3. What Is Bus Contention?

Bus contention occurs when two active drivers try to force different logic values onto the same signal.

For example, if the testbench drives B with `00000000` while the DUT drives B with `10101010`, both are trying to control the same bus.

In a typical four-state digital simulation with equal-strength drivers, conflicting bits resolve to `X`. In physical hardware, conflicting drivers can also cause excessive current or electrical stress.

## 4. Why Must the Destination Bus Be Released?

During an A-to-B test:

- The testbench drives A with the desired input pattern.
- The testbench releases B by driving `Z`.
- The DUT's enabled buffer drives B with the transferred data.
- The testbench observes B and compares it against the expected value.

Driving `Z` from the testbench does not mean that B must remain `Z`. It means that the testbench itself is not driving B, allowing the DUT to drive it.

The same principle applies in reverse during a B-to-A test.

## 5. Disabled-State Test

When `CE = 0`, both DUT buffer directions should be disabled.

The testbench releases both buses, then checks that both A and B remain `Z`.

This checks the high-impedance behavior without an external driver forcing either bus to a binary value.

## 6. Limitation

These directed tests cover basic transfer patterns and the disabled state. Additional tests can check more data patterns, direction switching, and isolation of the inactive direction.
