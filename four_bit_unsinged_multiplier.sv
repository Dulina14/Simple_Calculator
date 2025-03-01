module four_bit_unsigned_multiplier #(parameter N = 4)(
    input logic [N-1:0] A, B,
    output logic [2*N - 1:0] product
);
    logic [2*N - 1:0] partial_products [N-1:0];
    logic [2*N - 1:0] sum1, sum2, sum3;

    // Generate Partial Products
    always_comb begin
        for (int i = 0; i < N; i++) begin
            partial_products[i] = A[i] ? (B << i) : 0;
        end
    end

    // Summing the partial products
    eight_bit_adder add1(.A(partial_products[0]), .B(partial_products[1]), .Carry_in(0), .Sum(sum1), .Carry_out());
    eight_bit_adder add2(.A(sum1), .B(partial_products[2]), .Carry_in(0), .Sum(sum2), .Carry_out());
    eight_bit_adder add3(.A(sum2), .B(partial_products[3]), .Carry_in(0), .Sum(product), .Carry_out());

endmodule
