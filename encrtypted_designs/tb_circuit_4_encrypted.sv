  module tb_circuit_4;
  logic [3:0]d;
  logic [3:0]q;
  integer i=0;
  integer fd;

  circuit_4 uut(d,q);
  initial begin
   fd=$fopen("circuit_3", "w");   
    $fdisplay(fd,"=================================");
    $fdisplay(fd,"\t Din, output");
    $fmonitor(fd, "\t %b\t %b",d,q);
    for (int i=0;i< 10; i++) begin
       d=i; #5;end
 
         
    #10;     
    $fwrite(fd,"Circuit is Identified as : Binary to Gray Code");     
    $fdisplay(fd,"\n===================================");
    #10 $fclose(fd);    
    #10 $finish;
end
    
endmodule
