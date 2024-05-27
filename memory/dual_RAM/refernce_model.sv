import pkg::*;

class refernce_model;
   
  mailbox mbx_mon2ref,mbx_ref2scb;
  static bit [7:0] mem[8];
  transaction ref_trans;

  function new(mailbox mbx_mon2ref,mailbox mbx_ref2scb); 
    this.mbx_mon2ref = mbx_mon2ref;  
    this.mbx_ref2scb = mbx_ref2scb;
  endfunction
  

  task run();
    ref_trans = new();  
    fork   
	forever begin
	  mbx_mon2ref.get(ref_trans);
	  //ref_trans.dout=1'b0;
	  ref_trans.display("[MON-REF]1111 MBX GET",ref_trans); 
	  
	  if(ref_trans.en && !ref_trans.we) begin
	    ref_trans.dout = mem[ref_trans.addr];
	  end

	  else if(ref_trans.en && ref_trans.we) begin
	    mem[ref_trans.addr] = ref_trans.din;
	 end

	  mbx_ref2scb.put(ref_trans);
	  ref_trans.display("[REF-SCB]2222 MBX PUT",ref_trans); 
	 end  
     join_none
  endtask  
endclass
