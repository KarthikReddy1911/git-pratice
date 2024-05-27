 module tb_fa;
   logic ain,bin,cin,S_out,c_out; 
   bit[2:0] i;
   
   
   fa U1(ain,bin,cin,S_out,c_out);
   initial begin
     
     for(i=0;i<8;i++)
       begin
         {ain,bin,cin}=i;
         #5;
       end 
   end

endmodule
