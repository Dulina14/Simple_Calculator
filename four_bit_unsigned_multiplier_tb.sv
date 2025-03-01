`timescale 10ns/1ns
`include "one_bit_adder.sv"
`include "eight_bit_adder.sv"
`include "four_bit_unsigned_multiplier.sv"

module four_bit_unsigned_multiplier_tb;
    localparam N = 4;

    logic [N-1:0] A, B;
    logic [2*N-1:0] product;

    
    four_bit_unsigned_multiplier #(.N(N)) dut(.*);

    initial begin
        $dumpfile("four_bit_unsigned_multiplier_tb.vcd");
        $dumpvars(0, four_bit_unsigned_multiplier_tb);

        
        for (int i = 0; i < 10; i++) begin
            A = $random & 4'b1111;  // 0-15 range
            B = $random & 4'b1111;
            #10;

            assert (product == A * B) begin
                $display("Test Passed: A=%b, B=%b => Product=%b", A, B, product);
            end else begin
                $error("Test Failed: A=%b, B=%b => Product=%b", A, B, product);
            end
        end

        $finish;
    end
endmodule
