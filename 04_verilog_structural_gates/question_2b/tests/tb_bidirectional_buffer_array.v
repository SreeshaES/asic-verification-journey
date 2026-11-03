
`timescale 1ns/1ps

module tb_bidirectional_buffer_array;

    reg SR;
    reg CE;

    // Testbench drivers for the bidirectional buses
    reg [7:0] drive_A;
    reg [7:0] drive_B;

    wire [7:0] A;
    wire [7:0] B;

    integer errors = 0;

    // Drive each bus when enabled; otherwise release it to Z
    assign A = (drive_A === 8'bzzzzzzzz) ? 8'bzzzzzzzz : drive_A;
    assign B = (drive_B === 8'bzzzzzzzz) ? 8'bzzzzzzzz : drive_B;

    // Device under test
    bidirectional_buffer_array dut (
        .A(A),
        .B(B),
        .SR(SR),
        .CE(CE)
    );

    initial begin
        $dumpfile("bidirectional_buffer_array.vcd");
        $dumpvars(0, tb_bidirectional_buffer_array);

        $display("Starting bidirectional buffer array tests");

        // Initial state: release both buses
        CE = 0;
        SR = 0;
        drive_A = 8'bzzzzzzzz;
        drive_B = 8'bzzzzzzzz;
        #10;

        // Test 1: A -> B, SR = 1
        CE = 1;
        SR = 1;
        drive_A = 8'b10101010;
        drive_B = 8'bzzzzzzzz;
        #10;

        if (B !== 8'b10101010) begin
            $display("FAIL: A -> B, expected 10101010, got %b", B);
            errors = errors + 1;
        end else begin
            $display("PASS: A -> B alternating pattern");
        end

        // Test 2: A -> B, all ones
        drive_A = 8'b11111111;
        #10;

        if (B !== 8'b11111111) begin
            $display("FAIL: A -> B all ones, got %b", B);
            errors = errors + 1;
        end else begin
            $display("PASS: A -> B all ones");
        end

        // Test 3: B -> A, SR = 0
        SR = 0;
        drive_A = 8'bzzzzzzzz;
        drive_B = 8'b01010101;
        #10;

        if (A !== 8'b01010101) begin
            $display("FAIL: B -> A, expected 01010101, got %b", A);
            errors = errors + 1;
        end else begin
            $display("PASS: B -> A alternating pattern");
        end

        // Test 4: B -> A, all zeros
        drive_B = 8'b00000000;
        #10;

        if (A !== 8'b00000000) begin
            $display("FAIL: B -> A all zeros, got %b", A);
            errors = errors + 1;
        end else begin
            $display("PASS: B -> A all zeros");
        end

        // Test 5: Disabled state; both buses released
        CE = 0;
        drive_A = 8'bzzzzzzzz;
        drive_B = 8'bzzzzzzzz;
        #10;

        if ((A !== 8'bzzzzzzzz) || (B !== 8'bzzzzzzzz)) begin
            $display("FAIL: Disabled buses should be Z; A=%b B=%b", A, B);
            errors = errors + 1;
        end else begin
            $display("PASS: Both directions disabled");
        end

        // Summary
        $display("------------------------------");
        $display("Total errors: %0d", errors);

        if (errors == 0)
            $display("ALL TESTS PASSED");
        else
            $display("TEST FAILED");

        $finish;
    end

endmodule
