
module bidirectional_buffer_array (
    inout [7:0] A,
    inout [7:0] B,
    input SR,
    input CE
);

    wire nSR;
    wire en_A_to_B;
    wire en_B_to_A;

    // Invert the direction control
    not (nSR, SR);

    // Generate the two direction enable signals
    and (en_A_to_B, CE, SR);
    and (en_B_to_A, CE, nSR);

    // Bit 0: A0 <-> B0
    Buffer1 ab0 (B[0], A[0], en_A_to_B);
    Buffer1 ba0 (A[0], B[0], en_B_to_A);

    // Bit 1: A1 <-> B1
    Buffer1 ab1 (B[1], A[1], en_A_to_B);
    Buffer1 ba1 (A[1], B[1], en_B_to_A);

    // Bit 2: A2 <-> B2
    Buffer1 ab2 (B[2], A[2], en_A_to_B);
    Buffer1 ba2 (A[2], B[2], en_B_to_A);

    // Bit 3: A3 <-> B3
    Buffer1 ab3 (B[3], A[3], en_A_to_B);
    Buffer1 ba3 (A[3], B[3], en_B_to_A);

    // Bit 4: A4 <-> B4
    Buffer1 ab4 (B[4], A[4], en_A_to_B);
    Buffer1 ba4 (A[4], B[4], en_B_to_A);

    // Bit 5: A5 <-> B5
    Buffer1 ab5 (B[5], A[5], en_A_to_B);
    Buffer1 ba5 (A[5], B[5], en_B_to_A);

    // Bit 6: A6 <-> B6
    Buffer1 ab6 (B[6], A[6], en_A_to_B);
    Buffer1 ba6 (A[6], B[6], en_B_to_A);

    // Bit 7: A7 <-> B7
    Buffer1 ab7 (B[7], A[7], en_A_to_B);
    Buffer1 ba7 (A[7], B[7], en_B_to_A);

endmodule
