module tb_shift_reg_pitfall;
  wire B,C,D;
  reg clk,A;
  
  shift_reg_pitfall U1(clk,A,B,C,D);
 
  always
    #5 clk=~clk;
  
  initial begin
    clk=0;
    $monitor("At t = %0d, A = %0b, B = %0b, C = %0b, D = %0b", $time,A,B,C,D);
    A = 0;
    #5 A = 1;
    #5 A = 0;
    #5 A = 1;
    #50 $finish;
  end
 endmodule 
