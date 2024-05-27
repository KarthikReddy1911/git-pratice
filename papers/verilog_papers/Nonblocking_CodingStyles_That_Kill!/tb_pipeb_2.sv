module tb_pipeb_2;
  logic clk;
  logic[7:0] d,q3;
  
  pipeb_2 U1(q3, d, clk);

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
