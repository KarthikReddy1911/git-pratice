 module tb_piso_register;
   logic clk,load,en,Serial_Out;
   logic[7:0]Parallel_In;
   
   
   
   always   #5 clk=~clk;
   
   
   piso_register  #(8) U1(clk,load,en,Parallel_In,Serial_Out);
  
   initial begin
     clk=0;
     load=1;
     Parallel_In=9'h1AE;
     #7 load=0;
     #2 en=1;
     #100 $finish();
   end

endmodule
