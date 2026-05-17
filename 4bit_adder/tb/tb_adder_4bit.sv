`timescale 1ns/1ps

module tb_adder_4bit;
    logic [3:0] a, b;
    logic [4:0] sum;

    adder_4bit dut (
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin
        $dumpfile("sim/wave.vcd");
        $dumpvars(0, tb_adder_4bit);
        a = 4'd0;
        b = 4'd0;
        #10;
        $display("a=%0d b=%0d sum=%0d", a, b, sum);
        a = 4'd7;
        b = 4'd8;
        #10;
        $display("a=%0d b=%0d sum=%0d", a, b, sum);
        a = 4'd15;
        b = 4'd15;
        #10;
        $display("a=%0d b=%0d sum=%0d", a, b, sum);
        $finish;
    end
endmodule


