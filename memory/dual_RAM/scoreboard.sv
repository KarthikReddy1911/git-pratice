import pkg::*;
class scoreboard;
   
  mailbox mbx_mon2scb,mbx_ref2scb;
  
  transaction trans;
  transaction ref_trans;


  function new(mailbox mbx_mon2scb,mailbox mbx_ref2scb); 
    this.mbx_mon2scb = mbx_mon2scb;  
    this.mbx_ref2scb = mbx_ref2scb;
  endfunction
  

  task run();  
    ref_trans=new();
    trans=new();
    forever begin
      mbx_mon2scb.get(trans);
      trans.display("[MON-SCB] MBX GET",trans); 
      
      mbx_ref2scb.get(ref_trans);
      ref_trans.display("[MNO-REF] MBX GET",ref_trans); 
    
      if(ref_trans.dout == trans.dout)
         $display("Data Matched dout = %d,ref_dout =%d",trans.dout,ref_trans.dout);
      else 
         $display("Data not Matched dout = %d,ref_dout =%d",trans.dout,ref_trans.dout);
    end 
  endtask  
endclass
