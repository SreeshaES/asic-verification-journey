
module Buffer1 (
    output Y,
    input A,
    input EN
);

    assign Y = EN ? A : 1'bz;

endmodule
