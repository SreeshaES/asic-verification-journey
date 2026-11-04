
`timescale 1ns/1ps

module tb_even_parity_generator;

    reg I0, I1, I2, I3;
    reg I4, I5, I6, I7;
    wire OP;

    reg [7:0] inputs;
    reg expected;
    integer i;
    integer errors = 0;

    even_parity_generator dut (
        .I0(I0), .I1(I1), .I2(I2), .I3(I3),
        .I4(I4), .I5(I5), .I6(I6), .I7(I7),
        .OP(OP)
    );

    initial begin
        $dumpfile("even_parity_generator.vcd");
        $dumpvars(0, tb_even_parity_generator);

        $display("Starting even parity generator tests");
        $display("Inputs     OP  Expected");
        $display("------------------------");

        for (i = 0; i < 256; i = i + 1) begin
            inputs = i;

            {I7, I6, I5, I4, I3, I2, I1, I0} = inputs;

            // OP must be 1 when the number of 1s is even.
            expected = ~(^inputs);

            #5;

            if (OP !== expected) begin
                $display(
                    "FAIL: inputs=%b OP=%b expected=%b",
                    inputs, OP, expected
                );
                errors = errors + 1;
            end

            #5;
        end

        $display("------------------------");
        $display("Total combinations: 256");
        $display("Total errors: %0d", errors);

        if (errors == 0)
            $display("ALL TESTS PASSED");
        else
            $display("TEST FAILED");

        $finish;
    end

endmodule
