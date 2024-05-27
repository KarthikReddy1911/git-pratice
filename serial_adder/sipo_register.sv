
module sipo_register # (parameter WIDTH = 8) (
  input clk,rst,serial_in,en,
  output  reg [WIDTH:0] sum_out 
);
  
  reg [WIDTH:0] tmp;
   bit[4:0] i;
   
  always @(posedge clk or posedge rst) begin 
    if(rst)
      begin
        tmp <= 9'b0;i<=0;
      end
    else if(en && i<WIDTH+1)  begin
      tmp     <= tmp>>1;
      tmp[WIDTH]   <= serial_in;
      i <= i+1;
    end
    else
      sum_out = tmp;
  end

endmodule
