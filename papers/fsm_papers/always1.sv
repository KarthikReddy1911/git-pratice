module always1;
    reg A;
    bit B, C, D;

    always @(*) begin
        B <= A;
        C <= B;
        D <= C;
        $display("#%t A=%d, B=%d, C=%d, D=%d", $time, A, B, C, D);
    end

    initial begin        
            A = 0;
        #10 B = 1;
        #10 C = 1;
        #10 D =1;
        #10 A = 1;
        #10 B = 0; A = 0;
        #10 C = 0;
        #5 $finish; 
    end
endmodule

