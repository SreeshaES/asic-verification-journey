`timescale 1ns/1ps

module tb_minterm_function;

    reg A, B, C, D;
    wire F;

    reg [3:0] inputs;
    reg expected;
    integer i;
    integer errors = 0;

    minterm_function dut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .F(F)
    );

    initial begin
        $dumpfile("minterm_function.vcd");
        $dumpvars(0, tb_minterm_function);

        $display("Starting minterm function tests");
        $display("ABCD  F  Expected");
        $display("-----------------");

        for (i = 0; i < 16; i = i + 1) begin
            inputs = i;
            {A, B, C, D} = inputs;

            // Expected output is 1 for the specified minterms.
            case (inputs)
                4'd0, 4'd2, 4'd4, 4'd6,
                4'd9, 4'd10, 4'd13, 4'd15:
                    expected = 1'b1;

                default:
                    expected = 1'b0;
            endcase

            #5;

            $display("%b  %b  %b", inputs, F, expected);

            if (F !== expected) begin
                $display(
                    "FAIL: inputs=%b F=%b expected=%b",
                    inputs, F, expected
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