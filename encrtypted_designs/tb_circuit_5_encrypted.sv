  module tb_circuit_5;
  logic [7:0]d;
  logic [2:0]q;
  integer i=0;
  integer fd;
  
   circuit_5 uut(d,q);
  

   initial begin
   fd=$fopen("circuit_5", "w");   
    $fdisplay(fd,"=================================");
    $fdisplay(fd,"\t Din, output");
    $fmonitor(fd, "\t %b\t %b",d,q);
    for (int i=0;i<256; i++) begin
       d=i; #1;end
 
         
    #10;     
    $fwrite(fd,"Circuit is Identified as : Priority Encoder");     
    $fdisplay(fd,"\n===================================");
    #10 $fclose(fd);    
    #10 $finish;
end
    
endmodule
