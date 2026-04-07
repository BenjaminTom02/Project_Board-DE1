module MultiFunction (RESULT, S1, S2, A, B);
    output RESULT;
    input S1, S2, A, B;
    wire nots1, nots2, term0, term1, term2, term3, term4, term5;
    not inv1 (nots1, S1);
    not inv2 (nots2, S2);
    and and0 (term0, A, B);   
    xor xor1 (term2, A, B);   
    or  or1  (term1, A, B);   
    and and1 (term3, nots1, nots2, term0); 
    and and2 (term4, nots1, S2, term1);    
    and and3 (term5, S1, nots2, term2);    
    or or2 (RESULT, term3, term4, term5);
endmodule

module TestModule (RESULT, S1, S2, A, B);
    input RESULT;
    output S1, S2, A, B; 
    parameter stimDelay = 15;
	 reg S1, S2, A, B; 
	 
    initial begin
        S1 = 0; S2 = 0; A = 0; B = 0;
    end

    initial begin
        #stimDelay {S1, S2, A, B} = 0;
        #stimDelay {S1, S2, A, B} = 1;
        #stimDelay {S1, S2, A, B} = 2;
        #stimDelay {S1, S2, A, B} = 3;
        #stimDelay {S1, S2, A, B} = 4;
        #stimDelay {S1, S2, A, B} = 5;
        #stimDelay {S1, S2, A, B} = 6;
        #stimDelay {S1, S2, A, B} = 7;
        #stimDelay {S1, S2, A, B} = 8;
        #stimDelay {S1, S2, A, B} = 9;
        #stimDelay {S1, S2, A, B} = 10;
        #stimDelay {S1, S2, A, B} = 11;
        #stimDelay {S1, S2, A, B} = 12;
        #stimDelay {S1, S2, A, B} = 13;
        #stimDelay {S1, S2, A, B} = 14;
        #stimDelay {S1, S2, A, B} = 15;
    end
endmodule

module testBench;
    wire RESULT, A, B, S1, S2;
    MultiFunction dut (RESULT, S1, S2, A, B);
    TestModule tester (RESULT, S1, S2, A, B); 	 
endmodule