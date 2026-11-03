
module minority_function (
    input A,
    input B,
    input C,
    input D,
    output Y
);

    wire AB, AC, AD, BC, BD, CD;

    // Detect all pairs of inputs that are both 1
    and g1 (AB, A, B);
    and g2 (AC, A, C);
    and g3 (AD, A, D);
    and g4 (BC, B, C);
    and g5 (BD, B, D);
    and g6 (CD, C, D);

    // Minority output: 1 when no pair is simultaneously 1
    nor g7 (Y, AB, AC, AD, BC, BD, CD);

endmodule
