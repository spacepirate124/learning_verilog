`timescale 1ns/1ps

module tb_decoder3to8;
    logic [2:0] s;
    logic [7:0] out;

    decoder3to8 dut (
        .s(s),
        .out(out)
    );
        
    initial begin
        $dumpfile("sim/wave.vcd");
        $dumpvars(0, tb_decoder3to8);

        for (int i = 0; i < 8; i++) begin
            s = i;
            #10;
            $display("s=%0d out=%b", s, out);
        end
        $finish;
    end
endmodule