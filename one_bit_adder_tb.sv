`include "one_bit_adder.sv"
module one_bit_adder_tb;
    timescale 10ns/1ns;

    // Inputs
    logic A=0, Cin=0, B, Sum, Cout;

    one_bit_adder dut (.*);

    initial begin
        $dumpfile("one_bit_adder_tb.vcd");
        $dumpvars(0, one_bit_adder_tb);

        for (int i = 0; i < 8; i++) begin
            {A, B, Cin} = i; // Assigning  all the possible combinations to A,B,Cin
            #1  // 10ns
            assert ({Cout, Sum} == A + B + Cin) $display("Test Passed: A=%b, B=%b, Cin=%b => Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);
            else   $error ("Test Failed: A=%b, B=%b, Cin=%b => Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);
        end

        $finish;
    
    end
endmodule
