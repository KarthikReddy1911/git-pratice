module piso_register #(parameter WIDTH = 8)(
  input clk,load,en,
  input[WIDTH-1:0] Parallel_In,
  output Serial_Out);

  reg [WIDTH-1:0]tmp;
  reg data;
  always @(posedge clk )
    begin
      if(load)
        tmp<=Parallel_In;
      else if(en)  begin
        data <= tmp[0];
        tmp <= tmp>>1;
      end
    end
  assign Serial_Out = data;
endmodule
