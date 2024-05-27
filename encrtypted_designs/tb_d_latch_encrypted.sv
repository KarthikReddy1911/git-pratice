  module tb_d_latch;
  logic en,d;
  logic q;
  parameter USE_CONFIGURATION;
  integer fd;

 
  d_latch #(USE_CONFIGURATION) uut(d,en,q);

  
  initial begin

    fd=$fopen("d_latch", "w");

    $fdisplay(fd,"Parameter USE_CONFIGURATION  = %0d", USE_CONFIGURATION);
    $fdisplay(fd,"=================================");
    $fdisplay(fd,"\t En, Din, output");
    $fmonitor(fd, "\t %b\t %b,\t %b",en,d,q);
    en=0;d=0;
    #5 en=0;d=1;
    #5 en=1;d=0;
    #5 en=1;d=1;
       #5;  
    $fwrite(fd,"Circuit is Identified as :"); 
    case(USE_CONFIGURATION)
          0:$fwrite(fd,"Active Low Enable D Latch");
          1:$fwrite(fd,"Active High Enable D Latch");
          endcase
    $fdisplay(fd,"\n===================================");
    #10 $fclose(fd);    
    #10 $finish;
end
    
endmodule
