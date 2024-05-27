module tb_incomplete_sensitivity_list;
  wire C;
  reg A,B;
  
  incomplete_sensitivity_list U1(C,A,B);
  
  initial begin
    $monitor("At t = %0d, A = %0b, B = %0b, C = %0b", $time,A,B,C);
    A = 1;B=1;
    #10 A = 1;B=0;
    #10 A = 0;B=1;
    #10 A = 0;B=0;
    #50 $finish;
  end
  

  
endmodule
