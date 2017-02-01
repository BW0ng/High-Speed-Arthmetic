// input logic:
// a1, a0
// b1, b0
//
// output logic:
// aeb = a equal to b
// alb = a less than b
// agb = a greater than b

module mag_comp(input logic [1:0] A, B, output logic A_eq_B, A_lt_B, A_gt_B);

      // aeb = ~(A1A0B1B0) | (A1A0B1B0) |
      //          (~A1A0~B1B0) | (A1~A0B1~B0)
      assign A_eq_B = (~A[1] & ~A[0] & ~B[1] & ~B[0]) |
                      (~A[1] & A[0] & ~B[1] & B[0]) |
                      (A[1] & A[0] & B[1] & B[0]) |
                      (A[1] & ~A[0] & B[1] & ~B[0]);

      // alb = (A1B1) | (~A0~B1B0) |
      //          (A1~A0B0)
      assign A_lt_B = (A[1] & ~B[1]) |
                    (~A[0] & ~B[1] & B[0]) |
                    (A[1] & ~A[0] & B[0]);

      // agb = (~A1B1) | (~A1A0~B0) | (A0B1~B0)
      assign A_gt_B = (~A[1] & B[1]) |
                      (~A[1] & A[0] & ~B[0]) |
                      (A[0] & B[1] & ~B[0]);
endmodule
