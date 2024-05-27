  module tb_circuit_7;
  logic a,b;
  logic out_not,out_and,out_or;
  
  integer fd;
  
   all_gates_u1 uut(a,b,out_not,out_and,out_or);
   
  

   initial begin
   fd=$fopen("circuit_7", "w");   
    $fdisplay(fd,"=================================");
    $fdisplay(fd,"\t A\t B\tOutput");
    $fmonitor(fd, "\t %b\t %b\t %b\t %b\t %b",a,b,out_not,out_and,out_or);
    a=0;b=0;
    #5 a=0;b=1;
    #5 a=1;b=0;
    #5 a=1;b=1;         
    #10;     
         
    $fdisplay(fd,"\n===================================");
    #10 $fclose(fd);    
    #10 $finish;
end
    
endmodule
