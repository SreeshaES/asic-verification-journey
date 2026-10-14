module buffer_array (
    input E,
    input [7:0] I,
    output [7:0] D
);

    bufif1 b0 (D[0], I[0], E);
    bufif1 b1 (D[1], I[1], E);
    bufif1 b2 (D[2], I[2], E);
    bufif1 b3 (D[3], I[3], E);
    bufif1 b4 (D[4], I[4], E);
    bufif1 b5 (D[5], I[5], E);
    bufif1 b6 (D[6], I[6], E);
    bufif1 b7 (D[7], I[7], E);

endmodule
