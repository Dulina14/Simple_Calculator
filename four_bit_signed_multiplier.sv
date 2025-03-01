module four_bit_signed_multiplier(
    input logic signed [3:0] A, B,   
    output logic signed [7:0] product  
);
    
    logic signed [7:0] pp0, pp1, pp2, pp3, pp_correction;
    logic signed [7:0] sum1, sum2, sum3;


    
    always_comb begin
        
        pp0 = A[0] ? {{4{B[3]}}, B} : 8'b0;
        
        
        pp1 = A[1] ? {{3{B[3]}}, B, 1'b0} : 8'b0;
        
        
        pp2 = A[2] ? {{2{B[3]}}, B, 2'b0} : 8'b0;
        
        
        pp3 = A[3] ? {{1{~B[3]}}, ~B, 3'b0} : 8'b0;
        
        
        pp_correction = A[3] ? 8'b00001000 : 8'b0;
    end

    
    eight_bit_adder #(.N(8)) add1 (
        .A(pp0), 
        .B(pp1), 
        .Carry_in(1'b0), 
        .Sum(sum1), 
        .Carry_out()
    );

    eight_bit_adder #(.N(8)) add2 (
        .A(sum1), 
        .B(pp2), 
        .Carry_in(1'b0), 
        .Sum(sum2), 
        .Carry_out()
    );

    eight_bit_adder #(.N(8)) add3 (
        .A(sum2), 
        .B(pp3), 
        .Carry_in(1'b0), 
        .Sum(sum3), 
        .Carry_out()
    );

    eight_bit_adder #(.N(8)) add4 (
        .A(sum3), 
        .B(pp_correction), 
        .Carry_in(1'b0), 
        .Sum(product), 
        .Carry_out()
    );

endmodule