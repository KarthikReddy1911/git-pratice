module tb_MultiConfigDFlipFlop;
  logic clk,rst,d;
  logic out;
  parameter CFG=7;
  bit[2:0] cfg;
  integer fd;
  

MultiConfigDFlipFlop #(7) U1(rst,clk,d,out);
  
  always
      #10 clk=~clk;
  always
      #3 d=~d; 
  
    initial begin

    if ($value$plusargs("CFG=%d",cfg)) begin

    fd=$fopen("MultiConfigDFlipFlop.log", "w");    
    
    $fdisplay(fd,"Parameter read from command line: %0d",cfg);
    $fdisplay(fd,"======================================================");
    $fdisplay(fd,"\t Clk\t Rst\t Din\t Dout");
    $fmonitor(fd, "\t %b\t %b \t %b \t %b",clk,rst,d,out);
    clk=1;
     rst=0;
     d=1;
     #7 rst=1;
     #6 rst=0;
     #2 rst=1;
     #4 rst=0;
     #5 rst=~rst;
    
     #20 
    case(cfg)
          0:$fwrite(fd,"Clock_Edge:Posedge,\nReset_Type:Synchronous,\nReset_Polarity:Active_high\n");
          1:$fwrite(fd,"Clock_Edge:Posedge,\nReset_Type:Synchronous,\nReset_Polarity:Active_low\n");
          2:$fwrite(fd,"Clock_Edge:Negedge,\nReset_Type:Synchronous,\nReset_Polarity:Active_high\n");
          3:$fwrite(fd,"Clock_Edge:Negedge,\nReset_Type:Synchronous,\nReset_Polarity:Active_low\n");
          4:$fwrite(fd,"Clock_Edge:Posedge,\nReset_Type:Asynchronous,\nReset_Polarity:Active_high\n");
          5:$fwrite(fd,"Clock_Edge:Posedge,\nReset_Type:Asynchronous,\nReset_Polarity:Active_low\n");
          6:$fwrite(fd,"Clock_Edge:Negedge,\nReset_Type:Asynchronous,\nReset_Polarity:Active_low\n");
          7:$fwrite(fd,"Clock_Edge:Negedge,\nReset_Type:Asynchronous,\nReset_Polarity:Active_low\n");
    endcase
   
    end 
    $fdisplay(fd,"======================================================");
    $fclose(fd);    
    #10 $finish;
end
    
endmodule
