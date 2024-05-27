module tb_adder_t1;
  logic[3:0] sum, a, b;
  logic ci,co;
  
  
  adder_t1 U1(co, sum, a, b, ci);
  
  initial begin
   a=0;
   b=0;
    ci=0;
    #15 a=4'hA;
    #2 b=3;
    #2 a=2;
    #2 a=15;
    #3 ci=1;
    
    #10 $finish();
  end
  

endmodule
