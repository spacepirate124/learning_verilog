`timescale 1ns/1ps

module tb_priority_encoder;
    logic [3:0] in;
    logic [1:0] out;
    logic valid;

    priority_encoder dut (
        .in(in),
        .out(out),
        .valid(valid)
    );

initial begin
    $dumpfile("sim/wave.vcd");
    $dumpvars(0, tb_priority_encoder);
    for(int i = 0; i < 16; i++) begin
        in = i;
        #10;
        $display("in=%b out=%0d valid=%0d", in, out, valid);
    end
    $finish;
end
endmodule