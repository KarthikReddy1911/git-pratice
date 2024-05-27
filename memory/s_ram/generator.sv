import pkg::*;
class generator;
  
  transaction trans;

  int  repeat_count;
  mailbox mbx_gen2driv;
    
  //constructor
  function new(mailbox mbx_gen2driv);
    this.mbx_gen2driv = mbx_gen2driv;
  endfunction
  

  task run();  
    trans = new();  
    fork    
      repeat(50) begin
      wait(mbx_gen2driv.num()==0)
      trans.randomize() with {trans.en==1;};
      //trans.display("GENERATOR random",trans); 
      mbx_gen2driv.put(trans);
      trans.display("[GEN - DRIV] MBX PUT",trans);      
      end
    join_none
  endtask
endclass
