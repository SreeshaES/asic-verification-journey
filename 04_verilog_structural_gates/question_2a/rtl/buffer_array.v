
module buffer_array (
    input E,
    input [7:0] I,
    output [7:0] D
);

    Buffer1 b0 (D[0], I[0], E);
    Buffer1 b1 (D[1], I[1], E);
    Buffer1 b2 (D[2], I[2], E);
    Buffer1 b3 (D[3], I[3], E);
    Buffer1 b4 (D[4], I[4], E);
    Buffer1 b5 (D[5], I[5], E);
    Buffer1 b6 (D[6], I[6], E);
    Buffer1 b7 (D[7], I[7], E);

endmodule
