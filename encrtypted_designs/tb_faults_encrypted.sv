
module tb_faults;

  parameter D_W=32,DEPTH=16,CFG='hFFFF_FFFF;
  logic   i_clk;
  logic [D_W-1:0] i_data;
  logic[DEPTH-1:0] i_addr;
  logic         i_en;
  logic         i_wr_rbar;
  logic [D_W-1:0] o_out;

  
  faults #(D_W, DEPTH, CFG) U1(.i_clk(i_clk),.i_data(i_data),.i_addr(i_addr),.i_en(i_en),.i_wr_rbar(i_wr_rbar),.o_out(o_out));
 
  initial begin
    
    i_clk = 1'b0;
    i_data = 0;
    i_addr = 0;
    i_en = 1'b0;
    i_wr_rbar = 1'b0;
end

always 
      #5 i_clk = !i_clk;
    


  task write_mem;
    input [D_W-1:0] data;
    input [DEPTH-1:0] addr;
    begin      
      i_data = data;
      i_addr = addr;
      i_en = 1'b1;
      i_wr_rbar = 1'b1;
      @(posedge i_clk);
      @(posedge i_clk); 
        
      
    end
  endtask

  task read_mem;
    input [DEPTH-1:0] addr;
    begin     
      i_addr = addr;
      i_en = 1'b1;
      i_wr_rbar = 1'b0;
      @(posedge i_clk);
      @(posedge i_clk);       
      
       
    end
  endtask

 
  initial begin
   
    write_mem(32'hAABBCCDD, 0);
    write_mem(32'h12345678, 15);

    read_mem(0);
    read_mem(15);

    $finish;
  end

endmodule

