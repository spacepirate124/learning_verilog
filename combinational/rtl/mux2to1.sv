module mux2to1 (
    input logic a,
    input logic b,
    input logic s,
    output logic y
);

    always_comb begin
        if (s)
            y = b;
        else
            y = a;
    end

endmodule