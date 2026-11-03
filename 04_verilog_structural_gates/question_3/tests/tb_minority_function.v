
`timescale 1ns/1ps

module tb_minority_function;

    reg A, B, C, D;
    wire Y;

    reg expected;
    integer i;
    integer errors;
    integer ones;

    // Instantiate the design under test (DUT)
    minority_function dut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .Y(Y)
    );

    initial begin
        // Create waveform file
        $dumpfile("minority_function.vcd");
        $dumpvars(0, tb_minority_function);

        errors = 0;

        $display("A B C D | Y | Expected");
        $display("-----------------------");

        // Apply all 16 possible input combinations
        for (i = 0; i < 16; i = i + 1) begin
            {A, B, C, D} = i;
            #10;

            // Count the number of inputs that are 1
            ones = A + B + C + D;

            // Minority condition: fewer 1s than 0s
            expected = (ones < 2);

            $display("%b %b %b %b | %b | %b",
                     A, B, C, D, Y, expected);

            // Compare actual output against expected output
            if (Y !== expected) begin
                $display("ERROR: Incorrect output for input %b",
                         {A, B, C, D});
                errors = errors + 1;
            end
        end

        $display("-----------------------");
        $display("Total errors: %0d", errors);

        if (errors == 0)
            $display("ALL TESTS PASSED");
        else
            $display("TEST FAILED");

        $finish;
    end

endmodule