module tb_DigitalGates_encrypted;
  
logic input_0,input_1;
  logic out;
  parameter GATE_TYPE;
integer fd;

 
  DigitalGates #(GATE_TYPE) uut (.port1(input_0),.port2(input_1),.port3(out));

  
  initial begin

    fd=$fopen("Digital_gates_question.log", "w");

    $fdisplay(fd,"Parameter GATE_TYPE  = %0d", GATE_TYPE);
    $fdisplay(fd,"=================================");
    $fdisplay(fd,"\tinput_0, input_1, output");
    $fmonitor(fd, "\t %b\t %b,\t %b",input_0,input_1,out);
    input_0=0;input_1=0;
    #5 input_0=0;input_1=1;
    #5 input_0=1;input_1=0;
    #5 input_0=1;input_1=1;
       #5;  
    $fwrite(fd,"Identified the gate as "); 
    case(GATE_TYPE)
          0:$fwrite(fd,"AND");
          1:$fwrite(fd,"OR");
          2:$fwrite(fd,"XOR");
          3:$fwrite(fd,"NAND");
          4:$fwrite(fd,"NOR");
          5:$fwrite(fd,"XNOR");
          6:$fwrite(fd,"A+B'");
          default:$fwrite(fd,"AND"); endcase
    $fdisplay(fd,"\n===================================");
    #10 $fclose(fd);    
    #10 $finish;
end
    
endmodule
