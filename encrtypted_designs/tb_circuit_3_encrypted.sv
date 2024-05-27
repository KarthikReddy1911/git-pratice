  module tb_circuit_3;
  logic [9:0]d;
  logic [3:0]q;
  integer i;
  integer fd;

  circuit_3 uut(d,q);
  initial begin
   fd=$fopen("circuit_3", "w");   
    $fdisplay(fd,"=================================");
    $fdisplay(fd,"\t Din, output");
    $fmonitor(fd, "\t %b\t %b",d,q);
    d=1;
    for (int i = 1; i < 600; i = 2*i) begin
       d=i; #5;end
 
         
    #10;     
    $fwrite(fd,"Circuit is Identified as : Encoder[10 x 4]");     
    $fdisplay(fd,"\n===================================");
    #10 $fclose(fd);    
    #10 $finish;
end
    
endmodule
