module one_bit_adder (
    input logic A,
    input logic B,
    input logic Cin,
    output logic Sum,
    output logic Cout
);

logic wire_1, wire_2, wire_3;

assign wire_1 = A ^ B;
assign wire_2 = wire_1 & Cin;
assign wire_3 = A & B;
assign Cout = wire_2 | wire_3;
assign Sum  = wire_1 ^ Cin;

endmodule

