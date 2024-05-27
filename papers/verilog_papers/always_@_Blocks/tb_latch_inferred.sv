module tb_latch_inferred;
  wire A,C;
  reg Trigger,Pass;
  
latch_inferred U1(A,C,Trigger,Pass);
  
  initial begin
    $monitor("At t = %0d, A = %0b, C = %0b", $time,A,C);
    Trigger = 1;Pass=1;
    #10 Trigger = 0;Pass=1;
    #10 Trigger = 1;Pass=0;
    #10 Trigger = 0;Pass=1;
    #50 $finish;
  end
endmodule
