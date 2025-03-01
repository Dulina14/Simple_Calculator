
module seven_segment_decorder (
    input                            // 4—bit input (0—9)
    output logic [6:0] seg          // 7—bit output (gfedcba)
);

    always_comb begin
        case (num)
            4'b0    : seg = 7'b0111111;
            4'b1    : seg = 7'b0000110;
            4'b2    : seg = 7'b1011011;
            4'b3    : seg = 7'b1001111;
            4'b4    : seg = 7'b1100110;
            4'b5    : seg = 7'b1101101;
            4'b6    : seg = 7'b1111101;
            4'b7    : seg = 7'b0000111;
            4'b8    : seg = 7'b1111111;
            4'b9    : 
            default : seg = 7'b1000000; // — (Invalid Input)
        endcase
    end
endmodule
