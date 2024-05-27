 module tb_sipo_register;
   logic clk,rst,serial_in,en;
   logic[8:0]sum_out;
 
   
   always   #5 clk=~clk;
   
   sipo_register  #(8) U1(clk,rst,serial_in,en,sum_out);
  
   initial begin
     clk=0;rst=1;
     en=1;
     serial_in=1;
     #7 rst=0;
     #8 serial_in=1;
     #10 serial_in=1;
     #10 serial_in=1;
     #10 serial_in=0;
     #10 serial_in=1;
     #10 serial_in=0;
     #10 serial_in=1;
     #10 serial_in=1;
     #10 serial_in=1;
    #100 $finish();
   end
endmodule
