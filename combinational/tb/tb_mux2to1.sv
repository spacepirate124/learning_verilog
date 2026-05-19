`timescale 1ns/1ps

module tb_mux2to1;
    logic a, b, s, y;

    mux2to1 dut (
        .a(a),
        .b(b),
        .s(s),
        .y(y)
    );

    initial begin
        $dumpfile("sim/wave.vcd");
        $dumpvars(0, tb_mux2to1);
        a = 0;
        b = 0;
        s = 0;
        #10;
        $display("a=%0d b=%0d s=%0d y=%0d", a, b, s, y);
        a = 0;
        b = 1;
        s = 0;
        #10;
        $display("a=%0d b=%0d s=%0d y=%0d", a, b, s, y);
        a = 0;
        b = 1;
        s = 1;
        #10;
        $display("a=%0d b=%0d s=%0d y=%0d", a, b, s, y);
        a = 1;
        b = 0;
        s = 1   ;
        #10;
        $display("a=%0d b=%0d s=%0d y=%0d", a, b, s, y);
        $finish;
    end

endmodule