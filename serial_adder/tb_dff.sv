 module tb_dff;
   logic clk,rst,d,q;   
   always   #5 clk=~clk;
   
   
   dff U1(clk,rst,d,q);
  
   initial begin
     clk=0;rst=0;
     d=1;
     #7 rst=1;
     #8 d=1;
     #10 d=1;
     #10 d=1;
     #10 d=0;
     #10 d=1;
     #10 d=0;
     #10 d=1;
     #10 d=1;
     #10 d=1;

    #100 $finish();
   end
   
 
endmodule
