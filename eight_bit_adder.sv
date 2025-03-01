module eight_bit_adder #(parameter N=8) (
        input logic  [N-1:0] A, B,
        input logic  Carry_in,
        output logic [N-1:0] Sum,
        output logic Carry_out
    );

    logic C [N:0];
    assign C[0] = Carry_in;
    assign Carry_out = C[N];

    genvar i;
    for (i=0; i<N; i=i+1) begin:add
        one_bit_adder oba (
            .A(A[i]),
            .B(B[i]),
            .Cin(C[i]),
            .Sum(Sum[i]),
            .Cout(C[i+1])
        );
    end
endmodule
