module tb_pipen_1;
  logic clk;
  logic[7:0] d,q3;
  
  pipen_1 U1(q3, d, clk);

  initial begin
  clk = 0;
    d=10;
    #10 d=56;
    #10 d=89;
    #10 d=35;
  #100 $finish();
end

  always #5 clk = ~clk;

endmodule
