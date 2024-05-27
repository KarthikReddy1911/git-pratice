module tb_dffb;
  
  logic q, d, clk, rst;
  
  dffb U1(q, d, clk, rst);

  initial begin
  clk = 0;
    d=1;rst=1;
    #7 rst=0;
    #10 d=0;
    #10 d=1;
    #10 d=0;
  #100 $finish();
end

  always #5 clk = ~clk;

endmodule
