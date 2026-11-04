module minterm_function (
    input A, B, C, D,
    output F
);

    wire nA, nB, nC, nD;
    wire m0, m2, m4, m6;
    wire m9, m10, m13, m15;

    // Generate complemented inputs
    not (nA, A);
    not (nB, B);
    not (nC, C);
    not (nD, D);

    // Minterms: 0, 2, 4, 6
    and (m0, nA, nB, nC, nD);
    and (m2, nA, nB, C, nD);
    and (m4, nA, B, nC, nD);
    and (m6, nA, B, C, nD);

    // Minterms: 9, 10, 13, 15
    and (m9,  A, nB, nC, D);
    and (m10, A, nB, C, nD);
    and (m13, A, B, nC, D);
    and (m15, A, B, C, D);

    // Sum of minterms
    or (F, m0, m2, m4, m6, m9, m10, m13, m15);

endmodule