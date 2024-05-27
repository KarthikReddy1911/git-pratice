module dff(
  input clk,rst,din,
  output reg q);
 
 always @(posedge clk) begin
   if(rst)
       q <= 0;
   else
       q <= din;
   end
  
endmodule   
