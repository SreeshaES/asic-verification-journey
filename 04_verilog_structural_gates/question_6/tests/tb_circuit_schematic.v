
`timescale 1ns/1ps

module tb_circuit_schematic;

    reg A, B, C, D;
    wire Y;

    reg [3:0] inputs;
    reg expected;
    integer i;
    integer errors = 0;

    circuit_schematic dut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .Y(Y)
    );

    initial begin
        $dumpfile("circuit_schematic.vcd");
        $dumpvars(0, tb_circuit_schematic);

        $display("Starting circuit schematic tests");
        $display("ABCD  Y  Expected");
        $display("-----------------");

        for (i = 0; i < 16; i = i + 1) begin
            inputs = i;
            {A, B, C, D} = inputs;

            // Y should be HIGH only for ABCD = 1110.
            if (inputs == 4'b1110)
                expected = 1'b1;
            else
                expected = 1'b0;

            #5;

            $display("%b  %b  %b", inputs, Y, expected);

            if (Y !== expected) begin
                $display(
                    "FAIL: inputs=%b Y=%b expected=%b",
                    inputs, Y, expected
                );
                errors = errors + 1;
            end

            #5;
        end

        $display("-----------------");
        $display("Total combinations: 16");
        $display("Total errors: %0d", errors);

        if (errors == 0)
            $display("ALL TESTS PASSED");
        else
            $display("TEST FAILED");

        $finish;
    end

endmodule
