module tb_adder_t7a;
  logic[3:0] sum, a, b;
  logic ci,co;
  
  
  adder_t7a U1(co, sum, a, b, ci);
  
  initial begin
   a=0;
   b=0;
    ci=0;
    #15 a=4'hA;
    #2 b=3;
    #2 a=2;
    #2 a=15;
    #3 ci=1;
    
  end
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    #100 $finish();
  end
endmodule
