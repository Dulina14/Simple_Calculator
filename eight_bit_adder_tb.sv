`include "one_bit_adder.sv"
`include "eight_bit_adder.sv"

module eight_bit_adder_tb;
    timescale 10ns/1ns;

    localparam  N = 8;

    logic [N-1:0] A, B, Sum;
    logic Carry_in, Carry_out;

    eight_bit_adder #(.N(N)) dut(.*);

    initial begin
        $dumpfile("eight_bit_adder_tb.vcd");
        $dumpvars(0, eight_bit_adder_tb);

        for (int i = 0; i < 10; i++) begin
            
            A = $random % 256;
            B = $random % 256;
            Carry_in = i % 2; // Alternate between 0 and 1
            #10; 

            assert ({Carry_out, Sum} == A + B + Carry_in)  $display("Test Passed: A=%b, B=%b, Cin=%b => Sum=%b, Cout=%b", A, B, Carry_in, Sum, Carry_out);
            else $error("Test Failed: %d + %d + %d != {%d,%d}", A, B, Carry_in, Carry_out, Sum);
        end
        $finish;
    end

endmodule
