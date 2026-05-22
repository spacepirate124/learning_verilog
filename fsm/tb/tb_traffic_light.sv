`timescale 1ns/1ps

module tb_traffic_light;
    logic r, g, y, clk, rst;

    initial clk = 0;
    always #5 clk = ~clk;

    traffic_light dut (
        .r(r),
        .y(y),
        .g(g),
        .rst(rst),
        .clk(clk)
    );

    always @(posedge clk) begin
        if (!rst)
            $display("GREEN=%b YELLOW=%b RED=%b", g, y, r);
    end

    initial begin
        $dumpfile("sim/wave.vcd");
        $dumpvars(0, tb_traffic_light);
        rst = 1;
        repeat(3) @(posedge clk);
        rst = 0;

        repeat(25) @(posedge clk);
        $finish;
    end 
endmodule