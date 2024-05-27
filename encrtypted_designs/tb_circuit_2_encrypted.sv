module tb_circuit_2;
  reg a,b;
  wire c,y;
  circuit_2 U1(a,b,c,y);
  initial begin
     $monitor($time,"ns\ta = %b,\tb = %b,\tc = %b,\ty = %b",a,b,c,y);
    a=0;b=0;
    #5 a=1;b=0;
    #5 a=0;b=1;
    #5 a=1;b=1;
    #100 $finish;
  end
endmodule
