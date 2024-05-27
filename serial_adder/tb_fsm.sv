 module tb_fsm;
   logic start,clk,resetn,reset,load,enable; 
   
   
   always   #5 clk=~clk;
   
   
   fsm U1(start,clk,resetn,reset,load,enable);
  
   initial begin
     
     clk=0;
     start=0;
     resetn=0;
     #10 start=1;resetn=1;
     #10 start=0;
     #10 resetn=0;
     

    
   end
   

  
endmodule
