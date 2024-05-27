module tb_adder_t10b;
  logic[3:0] sum, a, b;
  logic ci,co;
  
  
  adder_t10b U1(co, sum, a, b, ci);
  
  initial begin
   a=0;
   b=0;
    ci=0;
    #15 a=4'hA;
    #2 b=3;
    #2 a=2;
    #2 a=15;
    
    
  end

endmodule
