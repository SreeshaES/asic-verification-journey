`timescale 1ns/1ps

module tb_buffer_array;

    reg E;
    reg [7:0] I;
    wire [7:0] D;

    integer errors;

    // Instantiate the design under test (DUT)
    buffer_array dut (
        .E(E),
        .I(I),
        .D(D)
    );

    initial begin
        errors = 0;

        $dumpfile("buffer_array.vcd");
        $dumpvars(0, tb_buffer_array);

        $display("Starting eight-bit buffer array test");

        // Test 1: Enable = 1, input all zeros
        E = 1'b1;
        I = 8'b00000000;
        #10;
        if (D !== I) begin
            $display("FAIL: E=1, I=%b, D=%b", I, D);
            errors = errors + 1;
        end else begin
            $display("PASS: All-zero input");
        end

        // Test 2: Enable = 1, input all ones
        I = 8'b11111111;
        #10;
        if (D !== I) begin
            $display("FAIL: E=1, I=%b, D=%b", I, D);
            errors = errors + 1;
        end else begin
            $display("PASS: All-one input");
        end

        // Test 3: Enable = 1, alternating pattern
        I = 8'b10101010;
        #10;
        if (D !== I) begin
            $display("FAIL: E=1, I=%b, D=%b", I, D);
            errors = errors + 1;
        end else begin
            $display("PASS: Alternating pattern");
        end

        // Test 4: Enable = 0, output should be high impedance
        E = 1'b0;
        #10;
        if (D !== 8'bzzzzzzzz) begin
            $display("FAIL: Expected Z, got D=%b", D);
            errors = errors + 1;
        end else begin
            $display("PASS: Disabled output is high impedance");
        end

        // Test 5: Disabled buffer with a different input
        I = 8'b01010101;
        #10;
        if (D !== 8'bzzzzzzzz) begin
            $display("FAIL: Expected Z, got D=%b", D);
            errors = errors + 1;
        end else begin
            $display("PASS: Output remains Z when input changes");
        end

        // Final summary
        $display("--------------------------------");
        $display("Total errors: %0d", errors);

        if (errors == 0)
            $display("ALL TESTS PASSED");
        else
            $display("TEST FAILED");

        $finish;
    end

endmodule
