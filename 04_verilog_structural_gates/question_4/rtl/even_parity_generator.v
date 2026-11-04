
module even_parity_generator (
    input I0, I1, I2, I3,
    input I4, I5, I6, I7,
    output OP
);

    wire xor_01;
    wire xor_23;
    wire xor_45;
    wire xor_67;
    wire xor_0123;
    wire xor_4567;
    wire xor_all;

    xor (xor_01,   I0, I1);
    xor (xor_23,   I2, I3);
    xor (xor_45,   I4, I5);
    xor (xor_67,   I6, I7);

    xor (xor_0123, xor_01, xor_23);
    xor (xor_4567, xor_45, xor_67);

    xor (xor_all, xor_0123, xor_4567);
    not (OP, xor_all);

endmodule
