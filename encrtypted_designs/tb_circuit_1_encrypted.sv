module tb_circuit_1;
  reg a,b,c;
  wire y;
  circuit_1 U1(.port1(a),.port2(b),.port3(c),.port4(y));
  logic[2:0] i;
  initial begin
     $monitor($time,"ns\ta = %b,\tb = %b,\tc = %b,\ty = %b",a,b,c,y);
    for(i=0;i<8;i++) begin
      {a,b,c}=i;
        #5;
    end
  end

initial begin
#100 $finish();
end
endmodule
