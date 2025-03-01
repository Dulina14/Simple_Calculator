
`include "one_bit_adder.sv"
`include "eight_bit_adder.sv"
`timescale 10ns/1ns
module four_bit_signed_multiplier_tb();
    // Test signals
    logic signed [3:0] A, B;
    logic signed [7:0] product;
    
    // Expected result for verification
    logic signed [7:0] expected_product;
    
    // Instantiate the multiplier
    four_bit_signed_multiplier dut(
        .A(A),
        .B(B),
        .product(product)
    );
    
    // Helper function to print test results
    function void print_test(input [3:0] a, input [3:0] b, input [7:0] prod, input [7:0] expected);
        $display("Test: %4d (%4b) × %4d (%4b) = %8b (%3d) | Expected: %8b (%3d) | %s", 
                 $signed(a), a, $signed(b), b, prod, $signed(prod), 
                 expected, $signed(expected), 
                 ($signed(prod) == $signed(expected)) ? "PASS" : "FAIL");
    endfunction
    
    // Test vectors
    initial begin
        $display("========== 4-bit Signed Multiplier Testbench ==========");
        $display("A × B = Product | Expected | Result");
        
        // Test case from the example: -3 × -7 = 21
        A = 4'b1101; // -3
        B = 4'b1001; // -7
        expected_product = 8'b00010101; // 21
        #10;
        print_test(A, B, product, expected_product);
        
        // Additional test cases covering various scenarios
        
        // Positive × Positive
        A = 4'b0011; // 3
        B = 4'b0101; // 5
        expected_product = 8'b00001111; // 15
        #10;
        print_test(A, B, product, expected_product);
        
        // Negative × Positive
        A = 4'b1110; // -2
        B = 4'b0110; // 6
        expected_product = 8'b11110100; // -12
        #10;
        print_test(A, B, product, expected_product);
        
        // Positive × Negative
        A = 4'b0100; // 4
        B = 4'b1011; // -5
        expected_product = 8'b11100100; // -20
        #10;
        print_test(A, B, product, expected_product);
        
        // Negative × Negative
        A = 4'b1010; // -6
        B = 4'b1100; // -4
        expected_product = 8'b00011000; // 24
        #10;
        print_test(A, B, product, expected_product);
        
        // Zero × Something
        A = 4'b0000; // 0
        B = 4'b1010; // -6
        expected_product = 8'b00000000; // 0
        #10;
        print_test(A, B, product, expected_product);
        
        // Something × Zero
        A = 4'b0111; // 7
        B = 4'b0000; // 0
        expected_product = 8'b00000000; // 0
        #10;
        print_test(A, B, product, expected_product);
        
        // Minimum value (-8)
        A = 4'b1000; // -8
        B = 4'b0011; // 3
        expected_product = 8'b11101000; // -24
        #10;
        print_test(A, B, product, expected_product);
        
        // Maximum value (7)
        A = 4'b0111; // 7
        B = 4'b0111; // 7
        expected_product = 8'b00110001; // 49
        #10;
        print_test(A, B, product, expected_product);
        
        // Extreme case: -8 × -8 = 64 (overflow)
        A = 4'b1000; // -8
        B = 4'b1000; // -8
        expected_product = 8'b01000000; // 64 (note: this actually overflows 8-bit signed range)
        #10;
        print_test(A, B, product, expected_product);
        
        $display("========== Testbench Complete ==========");
        $finish;
    end
    
    // Optional: Waveform dumping
    initial begin
        $dumpfile("four_bit_signed_multiplier.vcd");
        $dumpvars(0, four_bit_signed_multiplier_tb);
    end
    
endmodule