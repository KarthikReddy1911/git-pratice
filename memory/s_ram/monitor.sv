import pkg::*;
class monitor;
      virtual mem_intf mem_vif;

      mailbox mbx_mon2scb,mbx_mon2ref;
 
      transaction trans,trans1;

      function new(virtual mem_intf mem_vif,mailbox mbx_mon2scb,mailbox mbx_mon2ref);
	    this.mem_vif     = mem_vif;
	    this.mbx_mon2scb = mbx_mon2scb;
	    this.mbx_mon2ref = mbx_mon2ref;
      endfunction
      
      
      task run(); 
           trans  = new();
           trans1 = new();
	   fork    
	       forever @(mem_vif.monitor_cb) begin
	           trans.addr   = mem_vif.addr;
	           trans.we 	= mem_vif.we;
	           trans.din 	= mem_vif.din;
	           trans.en 	= mem_vif.en;
		   trans.dout   = mem_vif.dout;
		   trans.display("[MON-SCB] MBX PUT",trans); 
		   mbx_mon2scb.put(trans);
               end  

	       forever @(mem_vif.monitor_cb) begin
	          trans1.addr  = mem_vif.addr;
	          trans1.en    = mem_vif.en;
	          trans1.we    = mem_vif.we;
		  trans1.din   = mem_vif.din; 
	          $display($time,"*******************************************trans1=%d",trans1.dout);
	          trans1.display("[MON-REF] MBX PUT",trans1); 
	          mbx_mon2ref.put(trans1);
               end
	   join_none
      endtask
endclass
