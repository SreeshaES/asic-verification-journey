module circuit_schematic (
    input A, B, C, D,
    output Y
);

    wire nand_ab;
    wire not_d;
    wire and_cd;
    wire xnor_out;
    wire or_out;
    wire nor_out;

    // Stage 1: NAND gate
    nand (nand_ab, A, B);

    // Stage 2: Invert D and AND it with C
    not (not_d, D);
    and (and_cd, C, not_d);

    // Stage 3: XNOR gate
    xnor (xnor_out, nand_ab, and_cd);

    // Stage 4: OR gate
    or (or_out, nand_ab, xnor_out);

    // Stage 5: NOR gate
    nor (nor_out, and_cd, xnor_out);

    // Stage 6: Final NOR gate
    nor (Y, or_out, nor_out);

endmodule