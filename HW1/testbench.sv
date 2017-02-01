module testbench();

      logic [1:0] A;
      logic [1:0] B;
      logic A_eq_B;
      logic A_lt_B;
      logic A_gt_B;
      logic clk;

      mag_comp dut (A, B, A_eq_B, A_lt_B, A_gt_B);

      always @ ( * ) begin
            clk = 1;
            #10;
            clk = 0;
            #10;
      end

      initial begin
            // A1A0 = 00
            #0    A = 2'B00;
            #0    B = 2'B00;
            #20   B = 2'B01;
            #20   B = 2'B10;
            #20   B = 2'B11;

            // A1A0 = 01
            #20   A = 2'B01;
            #0    B = 2'B00;
            #20   B = 2'B01;
            #20   B = 2'B10;
            #20   B = 2'B11;

            // A1A0 = 10
            #20   A = 2'B10;
            #0    B = 2'B00;
            #20   B = 2'B01;
            #20   B = 2'B10;
            #20   B = 2'B11;

            // A1A0 = 11
            #20   A = 2'B11;
            #0    B = 2'B00;
            #20   B = 2'B01;
            #20   B = 2'B10;
            #20   B = 2'B11;

      end

endmodule
