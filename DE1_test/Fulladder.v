module Fulladder (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);
    // Logic của Full Adder:
    // Sum  = a ^ b ^ cin
    // Cout = (a & b) | (b & cin) | (a & cin)
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));
endmodule
