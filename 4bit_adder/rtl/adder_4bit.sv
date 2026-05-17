module adder_4bit (
    input logic [3:0] a,
    input logic [3:0] b,
    output logic [4:0] sum
);

    logic [3:1] carry;

    full_adder fa0 (
        .a(a[0]),
        .b(b[0]),
        .cin(1'b0),
        .sum(sum[0]),
        .cout(carry[1])
    );

    full_adder fa1 (
        .a(a[1]),
        .b(b[1]),
        .cin(carry[1]),
        .sum(sum[1]),
        .cout(carry[2])
    );

    full_adder fa2 (
        .a(a[2]),
        .b(b[2]),
        .cin(carry[2]),
        .sum(sum[2]),
        .cout(carry[3])
    );

    full_adder fa3 (
        .a(a[3]),
        .b(b[3]),
        .cin(carry[3]),
        .sum(sum[3]),
        .cout(sum[4])
    );

endmodule