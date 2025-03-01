`timescale 10ns/1ns
module seven_segment_decoder_tb();

    // Input & Output
    logic [3:0] num;
    logic [6:0] seg;

    // Instantiate DUT (Design Under Test)
    seven_segment_decoder dut (
        .num(num),
        .seg(seg)
    );

    
    logic [6:0] expected_seg [9:0];

    initial begin
        $dumpfile("seven_segment_decoder_tb.vcd");
        $dumpvars(0, dut);

       
        expected_seg[0] = 7'b0111111;
        expected_seg[1] = 7'b0000110;
        expected_seg[2] = 7'b1011011;
        expected_seg[3] = 7'b1001111;
        expected_seg[4] = 7'b1100110;
        expected_seg[5] = 7'b1101101;
        expected_seg[6] = 7'b1111101;
        expected_seg[7] = 7'b0000111;
        expected_seg[8] = 7'b1111111;
        expected_seg[9] = 7'b1101111;

        for (int i = 0; i < 10; i++) begin
            #1 num = i;
            #1 begin
                assert (seg == expected_seg[i]) 
                    $display("Test Passed: num=%d => seg=%b", num, seg);
                else 
                    $error("Test Failed: num=%d => seg=%b (Expected: %b)", num, seg, expected_seg[i]);
            end
        end

        $finish;
    end

endmodule
