module myPhoto (CA, OU, FL, TH, SY, TA, NO, SE, IN, LO);
    input SY, TA, NO, SE, IN, LO;
    output CA, OU, FL, TH;
    parameter delay = 10;

    // CAPTURE
    wire term1, term2;
    and #delay and_cap1 (term1, SY, TA, ~SE, LO, ~IN);
    and #delay and_cap2 (term2, SY, TA, SE, NO, ~LO, ~IN);
    nor #delay nor_cap1 (CA, term1, term2);

    // OUT OF FOCUS
    nand #delay nand_focus (OU, SY, IN, TA);

    // FLASH
    wire term_fs1, term_fs2, term_fs3;
    and #delay and_fls1 (term_fs1, SY, TA, SE, ~NO, ~IN);
    and #delay and_fls2 (term_fs2, SY, TA, ~LO, ~NO, ~IN);
    or #delay or_fls1 (term_fs3, term_fs1, term_fs2);
    not #delay not_fls (FL, term_fs3);

    wire term_TH;
    and #delay and_ther (term_TH, SY, NO, TA, SE);
    not #delay not_ther (TH, term_TH);
endmodule


module TestBench;

  // inputs
  reg SY, TA, NO, SE, IN, LO;

  // outputs
  wire CA, OU, FL, TH;

  // delay giữa các test
  parameter stimDelay = 15;

  // biến đếm
  integer i;

  // gọi module cần test
  myPhoto uut (
    .CA(CA),
    .OU(OU),
    .FL(FL),
    .TH(TH),
    .SY(SY),
    .TA(TA),
    .NO(NO),
    .SE(SE),
    .IN(IN),
    .LO(LO)
  );

  // chạy test 64 trường hợp
  initial begin

    {SY, TA, NO, SE, IN, LO} = 0;

    for (i = 0; i < 64; i = i + 1) begin
      {SY, TA, NO, SE, IN, LO} = i;
      #stimDelay;
    end

    $stop;
  end

endmodule